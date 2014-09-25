.class public abstract Lcom/jcraft/jsch/KeyPair;
.super Ljava/lang/Object;
.source "KeyPair.java"


# static fields
.field public static final DSA:I = 0x1

.field public static final ERROR:I = 0x0

.field public static final RSA:I = 0x2

.field public static final UNKNOWN:I = 0x3

.field static final VENDOR_FSECURE:I = 0x1

.field static final VENDOR_OPENSSH:I = 0x0

.field static final VENDOR_PUTTY:I = 0x2

.field private static final cr:[B

.field static header:[[B

.field private static final header1:[Ljava/lang/String;

.field private static final header2:[Ljava/lang/String;

.field private static final header3:[Ljava/lang/String;

.field private static space:[B


# instance fields
.field private cipher:Lcom/jcraft/jsch/Cipher;

.field private data:[B

.field private encrypted:Z

.field private hash:Lcom/jcraft/jsch/HASH;

.field private iv:[B

.field jsch:Lcom/jcraft/jsch/JSch;

.field private passphrase:[B

.field protected publicKeyComment:Ljava/lang/String;

.field private publickeyblob:[B

.field private random:Lcom/jcraft/jsch/Random;

.field vendor:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v2, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 49
    const-string v0, "\n"

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/jcraft/jsch/KeyPair;->cr:[B

    .line 96
    new-array v0, v2, [[B

    const-string v1, "Proc-Type: 4,ENCRYPTED"

    invoke-static {v1}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v1

    aput-object v1, v0, v3

    const-string v1, "DEK-Info: DES-EDE3-CBC,"

    invoke-static {v1}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v1

    aput-object v1, v0, v4

    sput-object v0, Lcom/jcraft/jsch/KeyPair;->header:[[B

    .line 158
    const-string v0, " "

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/jcraft/jsch/KeyPair;->space:[B

    .line 909
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "PuTTY-User-Key-File-2: "

    aput-object v1, v0, v3

    const-string v1, "Encryption: "

    aput-object v1, v0, v4

    const-string v1, "Comment: "

    aput-object v1, v0, v2

    const/4 v1, 0x3

    const-string v2, "Public-Lines: "

    aput-object v2, v0, v1

    sput-object v0, Lcom/jcraft/jsch/KeyPair;->header1:[Ljava/lang/String;

    .line 916
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "Private-Lines: "

    aput-object v1, v0, v3

    sput-object v0, Lcom/jcraft/jsch/KeyPair;->header2:[Ljava/lang/String;

    .line 920
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "Private-MAC: "

    aput-object v1, v0, v3

    sput-object v0, Lcom/jcraft/jsch/KeyPair;->header3:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/jcraft/jsch/JSch;)V
    .locals 3
    .parameter "jsch"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput v2, p0, Lcom/jcraft/jsch/KeyPair;->vendor:I

    .line 83
    const-string v0, "no comment"

    iput-object v0, p0, Lcom/jcraft/jsch/KeyPair;->publicKeyComment:Ljava/lang/String;

    .line 85
    iput-object v1, p0, Lcom/jcraft/jsch/KeyPair;->jsch:Lcom/jcraft/jsch/JSch;

    .line 477
    iput-boolean v2, p0, Lcom/jcraft/jsch/KeyPair;->encrypted:Z

    .line 478
    iput-object v1, p0, Lcom/jcraft/jsch/KeyPair;->data:[B

    .line 479
    iput-object v1, p0, Lcom/jcraft/jsch/KeyPair;->iv:[B

    .line 480
    iput-object v1, p0, Lcom/jcraft/jsch/KeyPair;->publickeyblob:[B

    .line 93
    iput-object p1, p0, Lcom/jcraft/jsch/KeyPair;->jsch:Lcom/jcraft/jsch/JSch;

    .line 94
    return-void
.end method

.method private static a2b(B)B
    .locals 1
    .parameter "c"

    .prologue
    .line 893
    const/16 v0, 0x30

    if-gt v0, p0, :cond_0

    const/16 v0, 0x39

    if-gt p0, v0, :cond_0

    add-int/lit8 v0, p0, -0x30

    int-to-byte v0, v0

    .line 894
    :goto_0
    return v0

    :cond_0
    add-int/lit8 v0, p0, -0x61

    add-int/lit8 v0, v0, 0xa

    int-to-byte v0, v0

    goto :goto_0
.end method

.method private static b2a(B)B
    .locals 1
    .parameter "c"

    .prologue
    .line 897
    if-ltz p0, :cond_0

    const/16 v0, 0x9

    if-gt p0, v0, :cond_0

    add-int/lit8 v0, p0, 0x30

    int-to-byte v0, v0

    .line 898
    :goto_0
    return v0

    :cond_0
    add-int/lit8 v0, p0, -0xa

    add-int/lit8 v0, v0, 0x41

    int-to-byte v0, v0

    goto :goto_0
.end method

.method private decrypt([B[B[B)[B
    .locals 7
    .parameter "data"
    .parameter "passphrase"
    .parameter "iv"

    .prologue
    .line 315
    :try_start_0
    invoke-virtual {p0, p2, p3}, Lcom/jcraft/jsch/KeyPair;->genKey([B[B)[B

    move-result-object v6

    .line 316
    .local v6, key:[B
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    const/4 v1, 0x1

    invoke-interface {v0, v1, v6, p3}, Lcom/jcraft/jsch/Cipher;->init(I[B[B)V

    .line 317
    invoke-static {v6}, Lcom/jcraft/jsch/Util;->bzero([B)V

    .line 318
    array-length v0, p1

    new-array v4, v0, [B

    .line 319
    .local v4, plain:[B
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    const/4 v2, 0x0

    array-length v3, p1

    const/4 v5, 0x0

    move-object v1, p1

    invoke-interface/range {v0 .. v5}, Lcom/jcraft/jsch/Cipher;->update([BII[BI)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 325
    .end local v4           #plain:[B
    .end local v6           #key:[B
    :goto_0
    return-object v4

    .line 322
    :catch_0
    move-exception v0

    .line 325
    const/4 v4, 0x0

    goto :goto_0
.end method

.method private encrypt([B[[B[B)[B
    .locals 12
    .parameter "plain"
    .parameter "_iv"
    .parameter "passphrase"

    .prologue
    const/4 v3, 0x0

    .line 275
    if-nez p3, :cond_0

    .line 307
    .end local p1
    :goto_0
    return-object p1

    .line 277
    .restart local p1
    :cond_0
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/jcraft/jsch/KeyPair;->genCipher()Lcom/jcraft/jsch/Cipher;

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    .line 278
    :cond_1
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    invoke-interface {v0}, Lcom/jcraft/jsch/Cipher;->getIVSize()I

    move-result v0

    new-array v9, v0, [B

    aput-object v9, p2, v3

    .line 280
    .local v9, iv:[B
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPair;->random:Lcom/jcraft/jsch/Random;

    if-nez v0, :cond_2

    invoke-direct {p0}, Lcom/jcraft/jsch/KeyPair;->genRandom()Lcom/jcraft/jsch/Random;

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/KeyPair;->random:Lcom/jcraft/jsch/Random;

    .line 281
    :cond_2
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPair;->random:Lcom/jcraft/jsch/Random;

    array-length v2, v9

    invoke-interface {v0, v9, v3, v2}, Lcom/jcraft/jsch/Random;->fill([BII)V

    .line 283
    invoke-virtual {p0, p3, v9}, Lcom/jcraft/jsch/KeyPair;->genKey([B[B)[B

    move-result-object v10

    .line 284
    .local v10, key:[B
    move-object v1, p1

    .line 289
    .local v1, encoded:[B
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    invoke-interface {v0}, Lcom/jcraft/jsch/Cipher;->getIVSize()I

    move-result v6

    .line 290
    .local v6, bsize:I
    array-length v0, v1

    div-int/2addr v0, v6

    add-int/lit8 v0, v0, 0x1

    mul-int/2addr v0, v6

    new-array v7, v0, [B

    .line 291
    .local v7, foo:[B
    array-length v0, v1

    invoke-static {v1, v3, v7, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 292
    array-length v0, v1

    rem-int/2addr v0, v6

    sub-int v11, v6, v0

    .line 293
    .local v11, padding:I
    array-length v0, v7

    add-int/lit8 v8, v0, -0x1

    .local v8, i:I
    :goto_1
    array-length v0, v7

    sub-int/2addr v0, v11

    if-gt v0, v8, :cond_3

    .line 294
    int-to-byte v0, v11

    aput-byte v0, v7, v8

    .line 293
    add-int/lit8 v8, v8, -0x1

    goto :goto_1

    .line 296
    :cond_3
    move-object v1, v7

    .line 300
    :try_start_0
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    const/4 v2, 0x0

    invoke-interface {v0, v2, v10, v9}, Lcom/jcraft/jsch/Cipher;->init(I[B[B)V

    .line 301
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    const/4 v2, 0x0

    array-length v3, v1

    const/4 v5, 0x0

    move-object v4, v1

    invoke-interface/range {v0 .. v5}, Lcom/jcraft/jsch/Cipher;->update([BII[BI)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 306
    :goto_2
    invoke-static {v10}, Lcom/jcraft/jsch/Util;->bzero([B)V

    move-object p1, v1

    .line 307
    goto :goto_0

    .line 303
    :catch_0
    move-exception v0

    goto :goto_2
.end method

.method private genCipher()Lcom/jcraft/jsch/Cipher;
    .locals 2

    .prologue
    .line 391
    :try_start_0
    iget-object v1, p0, Lcom/jcraft/jsch/KeyPair;->jsch:Lcom/jcraft/jsch/JSch;

    const-string v1, "3des-cbc"

    invoke-static {v1}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 392
    .local v0, c:Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/jcraft/jsch/Cipher;

    check-cast v1, Lcom/jcraft/jsch/Cipher;

    iput-object v1, p0, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 396
    .end local v0           #c:Ljava/lang/Class;
    :goto_0
    iget-object v1, p0, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    return-object v1

    .line 394
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private genHash()Lcom/jcraft/jsch/HASH;
    .locals 2

    .prologue
    .line 380
    :try_start_0
    iget-object v1, p0, Lcom/jcraft/jsch/KeyPair;->jsch:Lcom/jcraft/jsch/JSch;

    const-string v1, "md5"

    invoke-static {v1}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 381
    .local v0, c:Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/jcraft/jsch/HASH;

    check-cast v1, Lcom/jcraft/jsch/HASH;

    iput-object v1, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    .line 382
    iget-object v1, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    invoke-interface {v1}, Lcom/jcraft/jsch/HASH;->init()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 386
    .end local v0           #c:Ljava/lang/Class;
    :goto_0
    iget-object v1, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    return-object v1

    .line 384
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public static genKeyPair(Lcom/jcraft/jsch/JSch;I)Lcom/jcraft/jsch/KeyPair;
    .locals 1
    .parameter "jsch"
    .parameter "type"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 52
    const/16 v0, 0x400

    invoke-static {p0, p1, v0}, Lcom/jcraft/jsch/KeyPair;->genKeyPair(Lcom/jcraft/jsch/JSch;II)Lcom/jcraft/jsch/KeyPair;

    move-result-object v0

    return-object v0
.end method

.method public static genKeyPair(Lcom/jcraft/jsch/JSch;II)Lcom/jcraft/jsch/KeyPair;
    .locals 2
    .parameter "jsch"
    .parameter "type"
    .parameter "key_size"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 55
    const/4 v0, 0x0

    .line 56
    .local v0, kpair:Lcom/jcraft/jsch/KeyPair;
    const/4 v1, 0x1

    if-ne p1, v1, :cond_2

    new-instance v0, Lcom/jcraft/jsch/KeyPairDSA;

    .end local v0           #kpair:Lcom/jcraft/jsch/KeyPair;
    invoke-direct {v0, p0}, Lcom/jcraft/jsch/KeyPairDSA;-><init>(Lcom/jcraft/jsch/JSch;)V

    .line 58
    .restart local v0       #kpair:Lcom/jcraft/jsch/KeyPair;
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 59
    invoke-virtual {v0, p2}, Lcom/jcraft/jsch/KeyPair;->generate(I)V

    .line 61
    :cond_1
    return-object v0

    .line 57
    :cond_2
    const/4 v1, 0x2

    if-ne p1, v1, :cond_0

    new-instance v0, Lcom/jcraft/jsch/KeyPairRSA;

    .end local v0           #kpair:Lcom/jcraft/jsch/KeyPair;
    invoke-direct {v0, p0}, Lcom/jcraft/jsch/KeyPairRSA;-><init>(Lcom/jcraft/jsch/JSch;)V

    .restart local v0       #kpair:Lcom/jcraft/jsch/KeyPair;
    goto :goto_0
.end method

.method private genRandom()Lcom/jcraft/jsch/Random;
    .locals 5

    .prologue
    .line 368
    iget-object v2, p0, Lcom/jcraft/jsch/KeyPair;->random:Lcom/jcraft/jsch/Random;

    if-nez v2, :cond_0

    .line 370
    :try_start_0
    iget-object v2, p0, Lcom/jcraft/jsch/KeyPair;->jsch:Lcom/jcraft/jsch/JSch;

    const-string v2, "random"

    invoke-static {v2}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 371
    .local v0, c:Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/jcraft/jsch/Random;

    check-cast v2, Lcom/jcraft/jsch/Random;

    iput-object v2, p0, Lcom/jcraft/jsch/KeyPair;->random:Lcom/jcraft/jsch/Random;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 375
    .end local v0           #c:Ljava/lang/Class;
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/jcraft/jsch/KeyPair;->random:Lcom/jcraft/jsch/Random;

    return-object v2

    .line 373
    :catch_0
    move-exception v1

    .local v1, e:Ljava/lang/Exception;
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "connect: random "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static load(Lcom/jcraft/jsch/JSch;Ljava/lang/String;)Lcom/jcraft/jsch/KeyPair;
    .locals 3
    .parameter "jsch"
    .parameter "prvkey"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 509
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".pub"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 510
    .local v0, pubkey:Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 511
    const/4 v0, 0x0

    .line 513
    :cond_0
    invoke-static {p0, p1, v0}, Lcom/jcraft/jsch/KeyPair;->load(Lcom/jcraft/jsch/JSch;Ljava/lang/String;Ljava/lang/String;)Lcom/jcraft/jsch/KeyPair;

    move-result-object v1

    return-object v1
.end method

.method public static load(Lcom/jcraft/jsch/JSch;Ljava/lang/String;Ljava/lang/String;)Lcom/jcraft/jsch/KeyPair;
    .locals 6
    .parameter "jsch"
    .parameter "prvfile"
    .parameter "pubfile"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 517
    const/4 v2, 0x0

    .line 518
    .local v2, prvkey:[B
    const/4 v3, 0x0

    .line 521
    .local v3, pubkey:[B
    :try_start_0
    invoke-static {p1}, Lcom/jcraft/jsch/Util;->fromFile(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 527
    move-object v0, p2

    .line 528
    .local v0, _pubfile:Ljava/lang/String;
    if-nez p2, :cond_0

    .line 529
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".pub"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 533
    :cond_0
    :try_start_1
    invoke-static {v0}, Lcom/jcraft/jsch/Util;->fromFile(Ljava/lang/String;)[B
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v3

    .line 542
    :cond_1
    :try_start_2
    invoke-static {p0, v2, v3}, Lcom/jcraft/jsch/KeyPair;->load(Lcom/jcraft/jsch/JSch;[B[B)Lcom/jcraft/jsch/KeyPair;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v4

    .line 545
    invoke-static {v2}, Lcom/jcraft/jsch/Util;->bzero([B)V

    return-object v4

    .line 523
    .end local v0           #_pubfile:Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 524
    .local v1, e:Ljava/io/IOException;
    new-instance v4, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v1}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v1}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 535
    .end local v1           #e:Ljava/io/IOException;
    .restart local v0       #_pubfile:Ljava/lang/String;
    :catch_1
    move-exception v1

    .line 536
    .restart local v1       #e:Ljava/io/IOException;
    if-eqz p2, :cond_1

    .line 537
    new-instance v4, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v1}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v1}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 545
    .end local v1           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v4

    invoke-static {v2}, Lcom/jcraft/jsch/Util;->bzero([B)V

    throw v4
.end method

.method public static load(Lcom/jcraft/jsch/JSch;[B[B)Lcom/jcraft/jsch/KeyPair;
    .locals 38
    .parameter "jsch"
    .parameter "prvkey"
    .parameter "pubkey"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 551
    const/16 v33, 0x8

    move/from16 v0, v33

    new-array v0, v0, [B

    move-object/from16 v19, v0

    .line 552
    .local v19, iv:[B
    const/4 v13, 0x1

    .line 553
    .local v13, encrypted:Z
    const/4 v11, 0x0

    .line 555
    .local v11, data:[B
    const/16 v26, 0x0

    .line 557
    .local v26, publickeyblob:[B
    const/16 v29, 0x0

    .line 558
    .local v29, type:I
    const/16 v31, 0x0

    .line 559
    .local v31, vendor:I
    const-string v24, ""

    .line 560
    .local v24, publicKeyComment:Ljava/lang/String;
    const/4 v10, 0x0

    .line 563
    .local v10, cipher:Lcom/jcraft/jsch/Cipher;
    if-nez p2, :cond_3

    if-eqz p1, :cond_3

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v33, v0

    const/16 v34, 0xb

    move/from16 v0, v33

    move/from16 v1, v34

    if-le v0, v1, :cond_3

    const/16 v33, 0x0

    aget-byte v33, p1, v33

    if-nez v33, :cond_3

    const/16 v33, 0x1

    aget-byte v33, p1, v33

    if-nez v33, :cond_3

    const/16 v33, 0x2

    aget-byte v33, p1, v33

    if-nez v33, :cond_3

    const/16 v33, 0x3

    aget-byte v33, p1, v33

    const/16 v34, 0x7

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_3

    .line 568
    new-instance v8, Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, p1

    invoke-direct {v8, v0}, Lcom/jcraft/jsch/Buffer;-><init>([B)V

    .line 569
    .local v8, buf:Lcom/jcraft/jsch/Buffer;
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v33, v0

    move/from16 v0, v33

    invoke-virtual {v8, v0}, Lcom/jcraft/jsch/Buffer;->skip(I)V

    .line 570
    new-instance v7, Ljava/lang/String;

    invoke-virtual {v8}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v33

    move-object/from16 v0, v33

    invoke-direct {v7, v0}, Ljava/lang/String;-><init>([B)V

    .line 571
    .local v7, _type:Ljava/lang/String;
    invoke-virtual {v8}, Lcom/jcraft/jsch/Buffer;->rewind()V

    .line 573
    const/16 v21, 0x0

    .line 574
    .local v21, kpair:Lcom/jcraft/jsch/KeyPair;
    const-string v33, "ssh-rsa"

    move-object/from16 v0, v33

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_1

    .line 575
    move-object/from16 v0, p0

    invoke-static {v0, v8}, Lcom/jcraft/jsch/KeyPairRSA;->fromSSHAgent(Lcom/jcraft/jsch/JSch;Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/KeyPair;

    move-result-object v21

    .line 889
    .end local v7           #_type:Ljava/lang/String;
    .end local v8           #buf:Lcom/jcraft/jsch/Buffer;
    .end local v21           #kpair:Lcom/jcraft/jsch/KeyPair;
    :cond_0
    :goto_0
    return-object v21

    .line 577
    .restart local v7       #_type:Ljava/lang/String;
    .restart local v8       #buf:Lcom/jcraft/jsch/Buffer;
    .restart local v21       #kpair:Lcom/jcraft/jsch/KeyPair;
    :cond_1
    const-string v33, "ssh-dss"

    move-object/from16 v0, v33

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_2

    .line 578
    move-object/from16 v0, p0

    invoke-static {v0, v8}, Lcom/jcraft/jsch/KeyPairDSA;->fromSSHAgent(Lcom/jcraft/jsch/JSch;Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/KeyPair;

    move-result-object v21

    goto :goto_0

    .line 581
    :cond_2
    new-instance v33, Lcom/jcraft/jsch/JSchException;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "privatekey: invalid key "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    new-instance v35, Ljava/lang/String;

    const/16 v36, 0x4

    const/16 v37, 0x7

    move-object/from16 v0, v35

    move-object/from16 v1, p1

    move/from16 v2, v36

    move/from16 v3, v37

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([BII)V

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 587
    .end local v7           #_type:Ljava/lang/String;
    .end local v8           #buf:Lcom/jcraft/jsch/Buffer;
    .end local v21           #kpair:Lcom/jcraft/jsch/KeyPair;
    :cond_3
    move-object/from16 v8, p1

    .line 589
    .local v8, buf:[B
    if-eqz v8, :cond_4

    .line 590
    :try_start_0
    move-object/from16 v0, p0

    invoke-static {v0, v8}, Lcom/jcraft/jsch/KeyPair;->loadPPK(Lcom/jcraft/jsch/JSch;[B)Lcom/jcraft/jsch/KeyPair;

    move-result-object v23

    .line 591
    .local v23, ppk:Lcom/jcraft/jsch/KeyPair;
    if-eqz v23, :cond_4

    move-object/from16 v21, v23

    .line 592
    goto :goto_0

    .line 595
    .end local v23           #ppk:Lcom/jcraft/jsch/KeyPair;
    :cond_4
    if-eqz v8, :cond_6

    array-length v0, v8

    move/from16 v22, v0

    .line 596
    .local v22, len:I
    :goto_1
    const/4 v15, 0x0

    .line 599
    .local v15, i:I
    :goto_2
    move/from16 v0, v22

    if-ge v15, v0, :cond_5

    .line 600
    aget-byte v33, v8, v15

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_7

    add-int/lit8 v33, v15, 0x4

    move/from16 v0, v33

    move/from16 v1, v22

    if-ge v0, v1, :cond_7

    add-int/lit8 v33, v15, 0x1

    aget-byte v33, v8, v33

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_7

    add-int/lit8 v33, v15, 0x2

    aget-byte v33, v8, v33

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_7

    add-int/lit8 v33, v15, 0x3

    aget-byte v33, v8, v33

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_7

    add-int/lit8 v33, v15, 0x4

    aget-byte v33, v8, v33

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_7

    .line 608
    :cond_5
    :goto_3
    move/from16 v0, v22

    if-ge v15, v0, :cond_16

    .line 609
    aget-byte v33, v8, v15

    const/16 v34, 0x42

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_c

    add-int/lit8 v33, v15, 0x3

    move/from16 v0, v33

    move/from16 v1, v22

    if-ge v0, v1, :cond_c

    add-int/lit8 v33, v15, 0x1

    aget-byte v33, v8, v33

    const/16 v34, 0x45

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_c

    add-int/lit8 v33, v15, 0x2

    aget-byte v33, v8, v33

    const/16 v34, 0x47

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_c

    add-int/lit8 v33, v15, 0x3

    aget-byte v33, v8, v33

    const/16 v34, 0x49

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_c

    .line 610
    add-int/lit8 v15, v15, 0x6

    .line 611
    add-int/lit8 v33, v15, 0x2

    move/from16 v0, v33

    move/from16 v1, v22

    if-lt v0, v1, :cond_8

    .line 612
    new-instance v33, Lcom/jcraft/jsch/JSchException;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "invalid privatekey: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v33
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 855
    .end local v15           #i:I
    .end local v22           #len:I
    :catch_0
    move-exception v12

    .line 856
    .local v12, e:Ljava/lang/Exception;
    instance-of v0, v12, Lcom/jcraft/jsch/JSchException;

    move/from16 v33, v0

    if-eqz v33, :cond_46

    check-cast v12, Lcom/jcraft/jsch/JSchException;

    .end local v12           #e:Ljava/lang/Exception;
    throw v12

    .line 595
    :cond_6
    const/16 v22, 0x0

    goto/16 :goto_1

    .line 605
    .restart local v15       #i:I
    .restart local v22       #len:I
    :cond_7
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_2

    .line 613
    :cond_8
    :try_start_1
    aget-byte v33, v8, v15

    const/16 v34, 0x44

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_9

    add-int/lit8 v33, v15, 0x1

    aget-byte v33, v8, v33

    const/16 v34, 0x53

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_9

    add-int/lit8 v33, v15, 0x2

    aget-byte v33, v8, v33

    const/16 v34, 0x41

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_9

    const/16 v29, 0x1

    .line 622
    :goto_4
    add-int/lit8 v15, v15, 0x3

    .line 623
    goto/16 :goto_3

    .line 614
    :cond_9
    aget-byte v33, v8, v15

    const/16 v34, 0x52

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_a

    add-int/lit8 v33, v15, 0x1

    aget-byte v33, v8, v33

    const/16 v34, 0x53

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_a

    add-int/lit8 v33, v15, 0x2

    aget-byte v33, v8, v33

    const/16 v34, 0x41

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_a

    const/16 v29, 0x2

    goto :goto_4

    .line 615
    :cond_a
    aget-byte v33, v8, v15

    const/16 v34, 0x53

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_b

    add-int/lit8 v33, v15, 0x1

    aget-byte v33, v8, v33

    const/16 v34, 0x53

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_b

    add-int/lit8 v33, v15, 0x2

    aget-byte v33, v8, v33

    const/16 v34, 0x48

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_b

    .line 616
    const/16 v29, 0x3

    .line 617
    const/16 v31, 0x1

    goto :goto_4

    .line 620
    :cond_b
    new-instance v33, Lcom/jcraft/jsch/JSchException;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "invalid privatekey: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 625
    :cond_c
    aget-byte v33, v8, v15

    const/16 v34, 0x41

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_e

    add-int/lit8 v33, v15, 0x7

    move/from16 v0, v33

    move/from16 v1, v22

    if-ge v0, v1, :cond_e

    add-int/lit8 v33, v15, 0x1

    aget-byte v33, v8, v33

    const/16 v34, 0x45

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_e

    add-int/lit8 v33, v15, 0x2

    aget-byte v33, v8, v33

    const/16 v34, 0x53

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_e

    add-int/lit8 v33, v15, 0x3

    aget-byte v33, v8, v33

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_e

    add-int/lit8 v33, v15, 0x4

    aget-byte v33, v8, v33

    const/16 v34, 0x32

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_e

    add-int/lit8 v33, v15, 0x5

    aget-byte v33, v8, v33

    const/16 v34, 0x35

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_e

    add-int/lit8 v33, v15, 0x6

    aget-byte v33, v8, v33

    const/16 v34, 0x36

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_e

    add-int/lit8 v33, v15, 0x7

    aget-byte v33, v8, v33

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_e

    .line 627
    add-int/lit8 v15, v15, 0x8

    .line 628
    const-string v33, "aes256-cbc"

    invoke-static/range {v33 .. v33}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v33 .. v33}, Lcom/jcraft/jsch/Session;->checkCipher(Ljava/lang/String;)Z

    move-result v33

    if-eqz v33, :cond_d

    .line 629
    const-string v33, "aes256-cbc"

    invoke-static/range {v33 .. v33}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v33 .. v33}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    .line 630
    .local v9, c:Ljava/lang/Class;
    invoke-virtual {v9}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v33

    check-cast v33, Lcom/jcraft/jsch/Cipher;

    move-object/from16 v0, v33

    check-cast v0, Lcom/jcraft/jsch/Cipher;

    move-object v10, v0

    .line 632
    invoke-interface {v10}, Lcom/jcraft/jsch/Cipher;->getIVSize()I

    move-result v33

    move/from16 v0, v33

    new-array v0, v0, [B

    move-object/from16 v19, v0

    .line 633
    goto/16 :goto_3

    .line 635
    .end local v9           #c:Ljava/lang/Class;
    :cond_d
    new-instance v33, Lcom/jcraft/jsch/JSchException;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "privatekey: aes256-cbc is not available "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 639
    :cond_e
    aget-byte v33, v8, v15

    const/16 v34, 0x41

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_10

    add-int/lit8 v33, v15, 0x7

    move/from16 v0, v33

    move/from16 v1, v22

    if-ge v0, v1, :cond_10

    add-int/lit8 v33, v15, 0x1

    aget-byte v33, v8, v33

    const/16 v34, 0x45

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_10

    add-int/lit8 v33, v15, 0x2

    aget-byte v33, v8, v33

    const/16 v34, 0x53

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_10

    add-int/lit8 v33, v15, 0x3

    aget-byte v33, v8, v33

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_10

    add-int/lit8 v33, v15, 0x4

    aget-byte v33, v8, v33

    const/16 v34, 0x31

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_10

    add-int/lit8 v33, v15, 0x5

    aget-byte v33, v8, v33

    const/16 v34, 0x39

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_10

    add-int/lit8 v33, v15, 0x6

    aget-byte v33, v8, v33

    const/16 v34, 0x32

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_10

    add-int/lit8 v33, v15, 0x7

    aget-byte v33, v8, v33

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_10

    .line 641
    add-int/lit8 v15, v15, 0x8

    .line 642
    const-string v33, "aes192-cbc"

    invoke-static/range {v33 .. v33}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v33 .. v33}, Lcom/jcraft/jsch/Session;->checkCipher(Ljava/lang/String;)Z

    move-result v33

    if-eqz v33, :cond_f

    .line 643
    const-string v33, "aes192-cbc"

    invoke-static/range {v33 .. v33}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v33 .. v33}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    .line 644
    .restart local v9       #c:Ljava/lang/Class;
    invoke-virtual {v9}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v33

    check-cast v33, Lcom/jcraft/jsch/Cipher;

    move-object/from16 v0, v33

    check-cast v0, Lcom/jcraft/jsch/Cipher;

    move-object v10, v0

    .line 646
    invoke-interface {v10}, Lcom/jcraft/jsch/Cipher;->getIVSize()I

    move-result v33

    move/from16 v0, v33

    new-array v0, v0, [B

    move-object/from16 v19, v0

    .line 647
    goto/16 :goto_3

    .line 649
    .end local v9           #c:Ljava/lang/Class;
    :cond_f
    new-instance v33, Lcom/jcraft/jsch/JSchException;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "privatekey: aes192-cbc is not available "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 653
    :cond_10
    aget-byte v33, v8, v15

    const/16 v34, 0x41

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_12

    add-int/lit8 v33, v15, 0x7

    move/from16 v0, v33

    move/from16 v1, v22

    if-ge v0, v1, :cond_12

    add-int/lit8 v33, v15, 0x1

    aget-byte v33, v8, v33

    const/16 v34, 0x45

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_12

    add-int/lit8 v33, v15, 0x2

    aget-byte v33, v8, v33

    const/16 v34, 0x53

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_12

    add-int/lit8 v33, v15, 0x3

    aget-byte v33, v8, v33

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_12

    add-int/lit8 v33, v15, 0x4

    aget-byte v33, v8, v33

    const/16 v34, 0x31

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_12

    add-int/lit8 v33, v15, 0x5

    aget-byte v33, v8, v33

    const/16 v34, 0x32

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_12

    add-int/lit8 v33, v15, 0x6

    aget-byte v33, v8, v33

    const/16 v34, 0x38

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_12

    add-int/lit8 v33, v15, 0x7

    aget-byte v33, v8, v33

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_12

    .line 655
    add-int/lit8 v15, v15, 0x8

    .line 656
    const-string v33, "aes128-cbc"

    invoke-static/range {v33 .. v33}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v33 .. v33}, Lcom/jcraft/jsch/Session;->checkCipher(Ljava/lang/String;)Z

    move-result v33

    if-eqz v33, :cond_11

    .line 657
    const-string v33, "aes128-cbc"

    invoke-static/range {v33 .. v33}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v33 .. v33}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    .line 658
    .restart local v9       #c:Ljava/lang/Class;
    invoke-virtual {v9}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v33

    check-cast v33, Lcom/jcraft/jsch/Cipher;

    move-object/from16 v0, v33

    check-cast v0, Lcom/jcraft/jsch/Cipher;

    move-object v10, v0

    .line 660
    invoke-interface {v10}, Lcom/jcraft/jsch/Cipher;->getIVSize()I

    move-result v33

    move/from16 v0, v33

    new-array v0, v0, [B

    move-object/from16 v19, v0

    .line 661
    goto/16 :goto_3

    .line 663
    .end local v9           #c:Ljava/lang/Class;
    :cond_11
    new-instance v33, Lcom/jcraft/jsch/JSchException;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "privatekey: aes128-cbc is not available "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 667
    :cond_12
    aget-byte v33, v8, v15

    const/16 v34, 0x43

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_14

    add-int/lit8 v33, v15, 0x3

    move/from16 v0, v33

    move/from16 v1, v22

    if-ge v0, v1, :cond_14

    add-int/lit8 v33, v15, 0x1

    aget-byte v33, v8, v33

    const/16 v34, 0x42

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_14

    add-int/lit8 v33, v15, 0x2

    aget-byte v33, v8, v33

    const/16 v34, 0x43

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_14

    add-int/lit8 v33, v15, 0x3

    aget-byte v33, v8, v33

    const/16 v34, 0x2c

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_14

    .line 668
    add-int/lit8 v15, v15, 0x4

    .line 669
    const/16 v17, 0x0

    .local v17, ii:I
    move/from16 v16, v15

    .end local v15           #i:I
    .local v16, i:I
    :goto_5
    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v33, v0

    move/from16 v0, v17

    move/from16 v1, v33

    if-ge v0, v1, :cond_13

    .line 670
    add-int/lit8 v15, v16, 0x1

    .end local v16           #i:I
    .restart local v15       #i:I
    aget-byte v33, v8, v16

    invoke-static/range {v33 .. v33}, Lcom/jcraft/jsch/KeyPair;->a2b(B)B

    move-result v33

    shl-int/lit8 v33, v33, 0x4

    move/from16 v0, v33

    and-int/lit16 v0, v0, 0xf0

    move/from16 v33, v0

    add-int/lit8 v16, v15, 0x1

    .end local v15           #i:I
    .restart local v16       #i:I
    aget-byte v34, v8, v15

    invoke-static/range {v34 .. v34}, Lcom/jcraft/jsch/KeyPair;->a2b(B)B

    move-result v34

    and-int/lit8 v34, v34, 0xf

    add-int v33, v33, v34

    move/from16 v0, v33

    int-to-byte v0, v0

    move/from16 v33, v0

    aput-byte v33, v19, v17

    .line 669
    add-int/lit8 v17, v17, 0x1

    goto :goto_5

    :cond_13
    move/from16 v15, v16

    .line 672
    .end local v16           #i:I
    .restart local v15       #i:I
    goto/16 :goto_3

    .line 674
    .end local v17           #ii:I
    :cond_14
    aget-byte v33, v8, v15

    const/16 v34, 0xd

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_15

    add-int/lit8 v33, v15, 0x1

    array-length v0, v8

    move/from16 v34, v0

    move/from16 v0, v33

    move/from16 v1, v34

    if-ge v0, v1, :cond_15

    add-int/lit8 v33, v15, 0x1

    aget-byte v33, v8, v33

    const/16 v34, 0xa

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_15

    .line 675
    add-int/lit8 v15, v15, 0x1

    .line 676
    goto/16 :goto_3

    .line 678
    :cond_15
    aget-byte v33, v8, v15

    const/16 v34, 0xa

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_1c

    add-int/lit8 v33, v15, 0x1

    array-length v0, v8

    move/from16 v34, v0

    move/from16 v0, v33

    move/from16 v1, v34

    if-ge v0, v1, :cond_1c

    .line 679
    add-int/lit8 v33, v15, 0x1

    aget-byte v33, v8, v33

    const/16 v34, 0xa

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_17

    add-int/lit8 v15, v15, 0x2

    .line 699
    :cond_16
    :goto_6
    if-eqz v8, :cond_29

    .line 701
    if-nez v29, :cond_1d

    .line 702
    new-instance v33, Lcom/jcraft/jsch/JSchException;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "invalid privatekey: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 680
    :cond_17
    add-int/lit8 v33, v15, 0x1

    aget-byte v33, v8, v33

    const/16 v34, 0xd

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_18

    add-int/lit8 v33, v15, 0x2

    array-length v0, v8

    move/from16 v34, v0

    move/from16 v0, v33

    move/from16 v1, v34

    if-ge v0, v1, :cond_18

    add-int/lit8 v33, v15, 0x2

    aget-byte v33, v8, v33

    const/16 v34, 0xa

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_18

    .line 682
    add-int/lit8 v15, v15, 0x3

    goto :goto_6

    .line 684
    :cond_18
    const/16 v18, 0x0

    .line 685
    .local v18, inheader:Z
    add-int/lit8 v20, v15, 0x1

    .local v20, j:I
    :goto_7
    array-length v0, v8

    move/from16 v33, v0

    move/from16 v0, v20

    move/from16 v1, v33

    if-ge v0, v1, :cond_19

    .line 686
    aget-byte v33, v8, v20

    const/16 v34, 0xa

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_1a

    .line 690
    :cond_19
    :goto_8
    if-nez v18, :cond_1c

    .line 691
    add-int/lit8 v15, v15, 0x1

    .line 692
    const/4 v13, 0x0

    .line 693
    goto :goto_6

    .line 688
    :cond_1a
    aget-byte v33, v8, v20

    const/16 v34, 0x3a

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_1b

    const/16 v18, 0x1

    goto :goto_8

    .line 685
    :cond_1b
    add-int/lit8 v20, v20, 0x1

    goto :goto_7

    .line 696
    .end local v18           #inheader:Z
    .end local v20           #j:I
    :cond_1c
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_3

    .line 705
    :cond_1d
    move/from16 v27, v15

    .line 706
    .local v27, start:I
    :goto_9
    move/from16 v0, v22

    if-ge v15, v0, :cond_1e

    .line 707
    aget-byte v33, v8, v15

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_20

    .line 711
    :cond_1e
    sub-int v33, v22, v15

    if-eqz v33, :cond_1f

    sub-int v33, v15, v27

    if-nez v33, :cond_21

    .line 712
    :cond_1f
    new-instance v33, Lcom/jcraft/jsch/JSchException;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "invalid privatekey: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 708
    :cond_20
    add-int/lit8 v15, v15, 0x1

    goto :goto_9

    .line 716
    :cond_21
    sub-int v33, v15, v27

    move/from16 v0, v33

    new-array v0, v0, [B

    move-object/from16 v28, v0

    .line 717
    .local v28, tmp:[B
    const/16 v33, 0x0

    move-object/from16 v0, v28

    array-length v0, v0

    move/from16 v34, v0

    move/from16 v0, v27

    move-object/from16 v1, v28

    move/from16 v2, v33

    move/from16 v3, v34

    invoke-static {v8, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 718
    move-object/from16 v4, v28

    .line 720
    .local v4, _buf:[B
    const/16 v27, 0x0

    .line 721
    const/4 v15, 0x0

    .line 723
    array-length v6, v4

    .line 724
    .local v6, _len:I
    :goto_a
    if-ge v15, v6, :cond_27

    .line 725
    aget-byte v33, v4, v15

    const/16 v34, 0xa

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_26

    .line 726
    add-int/lit8 v33, v15, -0x1

    aget-byte v33, v4, v33

    const/16 v34, 0xd

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_23

    const/16 v32, 0x1

    .line 728
    .local v32, xd:Z
    :goto_b
    add-int/lit8 v34, v15, 0x1

    if-eqz v32, :cond_24

    const/16 v33, 0x1

    :goto_c
    sub-int v35, v15, v33

    sub-int v33, v6, v15

    add-int/lit8 v36, v33, -0x1

    if-eqz v32, :cond_25

    const/16 v33, 0x1

    :goto_d
    sub-int v33, v36, v33

    move/from16 v0, v34

    move/from16 v1, v35

    move/from16 v2, v33

    invoke-static {v4, v0, v4, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 733
    if-eqz v32, :cond_22

    add-int/lit8 v6, v6, -0x1

    .line 734
    :cond_22
    add-int/lit8 v6, v6, -0x1

    .line 735
    goto :goto_a

    .line 726
    .end local v32           #xd:Z
    :cond_23
    const/16 v32, 0x0

    goto :goto_b

    .line 728
    .restart local v32       #xd:Z
    :cond_24
    const/16 v33, 0x0

    goto :goto_c

    :cond_25
    const/16 v33, 0x0

    goto :goto_d

    .line 737
    .end local v32           #xd:Z
    :cond_26
    aget-byte v33, v4, v15

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_2a

    .line 741
    :cond_27
    sub-int v33, v15, v27

    if-lez v33, :cond_28

    .line 742
    sub-int v33, v15, v27

    move/from16 v0, v27

    move/from16 v1, v33

    invoke-static {v4, v0, v1}, Lcom/jcraft/jsch/Util;->fromBase64([BII)[B

    move-result-object v11

    .line 744
    :cond_28
    invoke-static {v4}, Lcom/jcraft/jsch/Util;->bzero([B)V

    .line 747
    .end local v4           #_buf:[B
    .end local v6           #_len:I
    .end local v27           #start:I
    .end local v28           #tmp:[B
    :cond_29
    if-eqz v11, :cond_2c

    array-length v0, v11

    move/from16 v33, v0

    const/16 v34, 0x4

    move/from16 v0, v33

    move/from16 v1, v34

    if-le v0, v1, :cond_2c

    const/16 v33, 0x0

    aget-byte v33, v11, v33

    const/16 v34, 0x3f

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_2c

    const/16 v33, 0x1

    aget-byte v33, v11, v33

    const/16 v34, 0x6f

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_2c

    const/16 v33, 0x2

    aget-byte v33, v11, v33

    const/16 v34, -0x7

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_2c

    const/16 v33, 0x3

    aget-byte v33, v11, v33

    const/16 v34, -0x15

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_2c

    .line 754
    new-instance v4, Lcom/jcraft/jsch/Buffer;

    invoke-direct {v4, v11}, Lcom/jcraft/jsch/Buffer;-><init>([B)V

    .line 755
    .local v4, _buf:Lcom/jcraft/jsch/Buffer;
    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 756
    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 757
    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v7

    .line 759
    .local v7, _type:[B
    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v33

    invoke-static/range {v33 .. v33}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v5

    .line 761
    .local v5, _cipher:Ljava/lang/String;
    const-string v33, "3des-cbc"

    move-object/from16 v0, v33

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_2b

    .line 762
    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 763
    array-length v0, v11

    move/from16 v33, v0

    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getOffSet()I

    move-result v34

    sub-int v33, v33, v34

    move/from16 v0, v33

    new-array v14, v0, [B

    .line 764
    .local v14, foo:[B
    invoke-virtual {v4, v14}, Lcom/jcraft/jsch/Buffer;->getByte([B)V

    .line 765
    move-object v11, v14

    .line 766
    const/4 v13, 0x1

    .line 767
    new-instance v33, Lcom/jcraft/jsch/JSchException;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "unknown privatekey format: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 738
    .end local v5           #_cipher:Ljava/lang/String;
    .end local v7           #_type:[B
    .end local v14           #foo:[B
    .local v4, _buf:[B
    .restart local v6       #_len:I
    .restart local v27       #start:I
    .restart local v28       #tmp:[B
    :cond_2a
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_a

    .line 769
    .end local v6           #_len:I
    .end local v27           #start:I
    .end local v28           #tmp:[B
    .local v4, _buf:Lcom/jcraft/jsch/Buffer;
    .restart local v5       #_cipher:Ljava/lang/String;
    .restart local v7       #_type:[B
    :cond_2b
    const-string v33, "none"

    move-object/from16 v0, v33

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_2c

    .line 770
    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 771
    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 773
    const/4 v13, 0x0

    .line 775
    array-length v0, v11

    move/from16 v33, v0

    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getOffSet()I

    move-result v34

    sub-int v33, v33, v34

    move/from16 v0, v33

    new-array v14, v0, [B

    .line 776
    .restart local v14       #foo:[B
    invoke-virtual {v4, v14}, Lcom/jcraft/jsch/Buffer;->getByte([B)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 777
    move-object v11, v14

    .line 781
    .end local v4           #_buf:Lcom/jcraft/jsch/Buffer;
    .end local v5           #_cipher:Ljava/lang/String;
    .end local v7           #_type:[B
    .end local v14           #foo:[B
    :cond_2c
    if-eqz p2, :cond_39

    .line 783
    move-object/from16 v8, p2

    .line 784
    :try_start_2
    array-length v0, v8

    move/from16 v22, v0

    .line 785
    array-length v0, v8

    move/from16 v33, v0

    const/16 v34, 0x4

    move/from16 v0, v33

    move/from16 v1, v34

    if-le v0, v1, :cond_3d

    const/16 v33, 0x0

    aget-byte v33, v8, v33

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_3d

    const/16 v33, 0x1

    aget-byte v33, v8, v33

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_3d

    const/16 v33, 0x2

    aget-byte v33, v8, v33

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_3d

    const/16 v33, 0x3

    aget-byte v33, v8, v33

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_3d

    .line 788
    const/16 v30, 0x1

    .line 789
    .local v30, valid:Z
    const/4 v15, 0x0

    .line 790
    :cond_2d
    add-int/lit8 v15, v15, 0x1

    array-length v0, v8

    move/from16 v33, v0

    move/from16 v0, v33

    if-le v0, v15, :cond_2e

    aget-byte v33, v8, v15

    const/16 v34, 0xa

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_2d

    .line 791
    :cond_2e
    array-length v0, v8

    move/from16 v33, v0

    move/from16 v0, v33

    if-gt v0, v15, :cond_2f

    const/16 v30, 0x0

    .line 793
    :cond_2f
    :goto_e
    if-eqz v30, :cond_31

    .line 794
    aget-byte v33, v8, v15

    const/16 v34, 0xa

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_35

    .line 795
    const/16 v18, 0x0

    .line 796
    .restart local v18       #inheader:Z
    add-int/lit8 v20, v15, 0x1

    .restart local v20       #j:I
    :goto_f
    array-length v0, v8

    move/from16 v33, v0

    move/from16 v0, v20

    move/from16 v1, v33

    if-ge v0, v1, :cond_30

    .line 797
    aget-byte v33, v8, v20

    const/16 v34, 0xa

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_33

    .line 800
    :cond_30
    :goto_10
    if-nez v18, :cond_35

    .line 801
    add-int/lit8 v15, v15, 0x1

    .line 807
    .end local v18           #inheader:Z
    .end local v20           #j:I
    :cond_31
    array-length v0, v8

    move/from16 v33, v0

    move/from16 v0, v33

    if-gt v0, v15, :cond_32

    const/16 v30, 0x0

    .line 809
    :cond_32
    move/from16 v27, v15

    .line 810
    .restart local v27       #start:I
    :goto_11
    if-eqz v30, :cond_37

    move/from16 v0, v22

    if-ge v15, v0, :cond_37

    .line 811
    aget-byte v33, v8, v15

    const/16 v34, 0xa

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_36

    .line 812
    add-int/lit8 v33, v15, 0x1

    sub-int v34, v22, v15

    add-int/lit8 v34, v34, -0x1

    move/from16 v0, v33

    move/from16 v1, v34

    invoke-static {v8, v0, v8, v15, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 813
    add-int/lit8 v22, v22, -0x1

    .line 814
    goto :goto_11

    .line 798
    .end local v27           #start:I
    .restart local v18       #inheader:Z
    .restart local v20       #j:I
    :cond_33
    aget-byte v33, v8, v20

    const/16 v34, 0x3a

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_34

    const/16 v18, 0x1

    goto :goto_10

    .line 796
    :cond_34
    add-int/lit8 v20, v20, 0x1

    goto :goto_f

    .line 805
    .end local v18           #inheader:Z
    .end local v20           #j:I
    :cond_35
    add-int/lit8 v15, v15, 0x1

    goto :goto_e

    .line 816
    .restart local v27       #start:I
    :cond_36
    aget-byte v33, v8, v15

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_3b

    .line 819
    :cond_37
    if-eqz v30, :cond_39

    .line 820
    sub-int v33, v15, v27

    move/from16 v0, v27

    move/from16 v1, v33

    invoke-static {v8, v0, v1}, Lcom/jcraft/jsch/Util;->fromBase64([BII)[B

    move-result-object v26

    .line 821
    if-eqz p1, :cond_38

    const/16 v33, 0x3

    move/from16 v0, v29

    move/from16 v1, v33

    if-ne v0, v1, :cond_39

    .line 822
    :cond_38
    const/16 v33, 0x8

    aget-byte v33, v26, v33
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    const/16 v34, 0x64

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_3c

    const/16 v29, 0x1

    .line 862
    .end local v27           #start:I
    .end local v30           #valid:Z
    :cond_39
    :goto_12
    const/16 v21, 0x0

    .line 863
    .restart local v21       #kpair:Lcom/jcraft/jsch/KeyPair;
    const/16 v33, 0x1

    move/from16 v0, v29

    move/from16 v1, v33

    if-ne v0, v1, :cond_48

    new-instance v21, Lcom/jcraft/jsch/KeyPairDSA;

    .end local v21           #kpair:Lcom/jcraft/jsch/KeyPair;
    move-object/from16 v0, v21

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/KeyPairDSA;-><init>(Lcom/jcraft/jsch/JSch;)V

    .line 866
    .restart local v21       #kpair:Lcom/jcraft/jsch/KeyPair;
    :cond_3a
    :goto_13
    if-eqz v21, :cond_0

    .line 867
    move-object/from16 v0, v21

    iput-boolean v13, v0, Lcom/jcraft/jsch/KeyPair;->encrypted:Z

    .line 868
    move-object/from16 v0, v26

    move-object/from16 v1, v21

    iput-object v0, v1, Lcom/jcraft/jsch/KeyPair;->publickeyblob:[B

    .line 869
    move/from16 v0, v31

    move-object/from16 v1, v21

    iput v0, v1, Lcom/jcraft/jsch/KeyPair;->vendor:I

    .line 870
    move-object/from16 v0, v24

    move-object/from16 v1, v21

    iput-object v0, v1, Lcom/jcraft/jsch/KeyPair;->publicKeyComment:Ljava/lang/String;

    .line 871
    move-object/from16 v0, v21

    iput-object v10, v0, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    .line 873
    if-eqz v13, :cond_49

    .line 874
    const/16 v33, 0x1

    move/from16 v0, v33

    move-object/from16 v1, v21

    iput-boolean v0, v1, Lcom/jcraft/jsch/KeyPair;->encrypted:Z

    .line 875
    move-object/from16 v0, v19

    move-object/from16 v1, v21

    iput-object v0, v1, Lcom/jcraft/jsch/KeyPair;->iv:[B

    .line 876
    move-object/from16 v0, v21

    iput-object v11, v0, Lcom/jcraft/jsch/KeyPair;->data:[B

    goto/16 :goto_0

    .line 817
    .end local v21           #kpair:Lcom/jcraft/jsch/KeyPair;
    .restart local v27       #start:I
    .restart local v30       #valid:Z
    :cond_3b
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_11

    .line 823
    :cond_3c
    const/16 v33, 0x8

    :try_start_3
    aget-byte v33, v26, v33

    const/16 v34, 0x72

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_39

    const/16 v29, 0x2

    goto :goto_12

    .line 828
    .end local v27           #start:I
    .end local v30           #valid:Z
    :cond_3d
    const/16 v33, 0x0

    aget-byte v33, v8, v33

    const/16 v34, 0x73

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_39

    const/16 v33, 0x1

    aget-byte v33, v8, v33

    const/16 v34, 0x73

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_39

    const/16 v33, 0x2

    aget-byte v33, v8, v33

    const/16 v34, 0x68

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_39

    const/16 v33, 0x3

    aget-byte v33, v8, v33

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_39

    .line 829
    if-nez p1, :cond_3e

    array-length v0, v8

    move/from16 v33, v0

    const/16 v34, 0x7

    move/from16 v0, v33

    move/from16 v1, v34

    if-le v0, v1, :cond_3e

    .line 831
    const/16 v33, 0x4

    aget-byte v33, v8, v33

    const/16 v34, 0x64

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_42

    const/16 v29, 0x1

    .line 834
    :cond_3e
    :goto_14
    const/4 v15, 0x0

    .line 835
    :goto_15
    move/from16 v0, v22

    if-ge v15, v0, :cond_3f

    aget-byte v33, v8, v15

    const/16 v34, 0x20

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_43

    :cond_3f
    add-int/lit8 v15, v15, 0x1

    .line 836
    move/from16 v0, v22

    if-ge v15, v0, :cond_4b

    .line 837
    move/from16 v27, v15

    .line 838
    .restart local v27       #start:I
    :goto_16
    move/from16 v0, v22

    if-ge v15, v0, :cond_40

    aget-byte v33, v8, v15

    const/16 v34, 0x20

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_44

    .line 839
    :cond_40
    sub-int v33, v15, v27

    move/from16 v0, v27

    move/from16 v1, v33

    invoke-static {v8, v0, v1}, Lcom/jcraft/jsch/Util;->fromBase64([BII)[B

    move-result-object v26

    move/from16 v16, v15

    .line 841
    .end local v15           #i:I
    .end local v27           #start:I
    .restart local v16       #i:I
    :goto_17
    add-int/lit8 v15, v16, 0x1

    .end local v16           #i:I
    .restart local v15       #i:I
    move/from16 v0, v16

    move/from16 v1, v22

    if-ge v0, v1, :cond_39

    .line 842
    move/from16 v27, v15

    .line 843
    .restart local v27       #start:I
    :goto_18
    move/from16 v0, v22

    if-ge v15, v0, :cond_41

    aget-byte v33, v8, v15

    const/16 v34, 0xa

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_45

    .line 844
    :cond_41
    move/from16 v0, v22

    if-ge v15, v0, :cond_39

    .line 845
    new-instance v25, Ljava/lang/String;

    sub-int v33, v15, v27

    move-object/from16 v0, v25

    move/from16 v1, v27

    move/from16 v2, v33

    invoke-direct {v0, v8, v1, v2}, Ljava/lang/String;-><init>([BII)V

    .end local v24           #publicKeyComment:Ljava/lang/String;
    .local v25, publicKeyComment:Ljava/lang/String;
    move-object/from16 v24, v25

    .end local v25           #publicKeyComment:Ljava/lang/String;
    .restart local v24       #publicKeyComment:Ljava/lang/String;
    goto/16 :goto_12

    .line 832
    .end local v27           #start:I
    :cond_42
    const/16 v33, 0x4

    aget-byte v33, v8, v33
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    const/16 v34, 0x72

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_3e

    const/16 v29, 0x2

    goto :goto_14

    .line 835
    :cond_43
    add-int/lit8 v15, v15, 0x1

    goto :goto_15

    .line 838
    .restart local v27       #start:I
    :cond_44
    add-int/lit8 v15, v15, 0x1

    goto :goto_16

    .line 843
    :cond_45
    add-int/lit8 v15, v15, 0x1

    goto :goto_18

    .line 857
    .end local v15           #i:I
    .end local v22           #len:I
    .end local v27           #start:I
    .restart local v12       #e:Ljava/lang/Exception;
    :cond_46
    instance-of v0, v12, Ljava/lang/Throwable;

    move/from16 v33, v0

    if-eqz v33, :cond_47

    .line 858
    new-instance v33, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v12}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v34

    move-object/from16 v0, v33

    move-object/from16 v1, v34

    invoke-direct {v0, v1, v12}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v33

    .line 859
    :cond_47
    new-instance v33, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v12}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 864
    .end local v12           #e:Ljava/lang/Exception;
    .restart local v15       #i:I
    .restart local v21       #kpair:Lcom/jcraft/jsch/KeyPair;
    .restart local v22       #len:I
    :cond_48
    const/16 v33, 0x2

    move/from16 v0, v29

    move/from16 v1, v33

    if-ne v0, v1, :cond_3a

    new-instance v21, Lcom/jcraft/jsch/KeyPairRSA;

    .end local v21           #kpair:Lcom/jcraft/jsch/KeyPair;
    move-object/from16 v0, v21

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/KeyPairRSA;-><init>(Lcom/jcraft/jsch/JSch;)V

    .restart local v21       #kpair:Lcom/jcraft/jsch/KeyPair;
    goto/16 :goto_13

    .line 879
    :cond_49
    move-object/from16 v0, v21

    invoke-virtual {v0, v11}, Lcom/jcraft/jsch/KeyPair;->parse([B)Z

    move-result v33

    if-eqz v33, :cond_4a

    .line 880
    const/16 v33, 0x0

    move/from16 v0, v33

    move-object/from16 v1, v21

    iput-boolean v0, v1, Lcom/jcraft/jsch/KeyPair;->encrypted:Z

    goto/16 :goto_0

    .line 884
    :cond_4a
    new-instance v33, Lcom/jcraft/jsch/JSchException;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "invalid privatekey: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 851
    .end local v21           #kpair:Lcom/jcraft/jsch/KeyPair;
    :catch_1
    move-exception v33

    goto/16 :goto_12

    :cond_4b
    move/from16 v16, v15

    .end local v15           #i:I
    .restart local v16       #i:I
    goto/16 :goto_17
.end method

.method static loadPPK(Lcom/jcraft/jsch/JSch;[B)Lcom/jcraft/jsch/KeyPair;
    .locals 21
    .parameter "jsch"
    .parameter "buf"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 925
    const/16 v18, 0x0

    .line 926
    .local v18, pubkey:[B
    const/16 v16, 0x0

    .line 927
    .local v16, prvkey:[B
    const/4 v14, 0x0

    .line 929
    .local v14, lines:I
    new-instance v10, Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, p1

    invoke-direct {v10, v0}, Lcom/jcraft/jsch/Buffer;-><init>([B)V

    .line 930
    .local v10, buffer:Lcom/jcraft/jsch/Buffer;
    new-instance v20, Ljava/util/Hashtable;

    invoke-direct/range {v20 .. v20}, Ljava/util/Hashtable;-><init>()V

    .line 933
    .local v20, v:Ljava/util/Hashtable;
    :cond_0
    move-object/from16 v0, v20

    invoke-static {v10, v0}, Lcom/jcraft/jsch/KeyPair;->parseHeader(Lcom/jcraft/jsch/Buffer;Ljava/util/Hashtable;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 937
    const-string v3, "PuTTY-User-Key-File-2"

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    .line 938
    .local v19, typ:Ljava/lang/String;
    if-nez v19, :cond_1

    .line 939
    const/4 v2, 0x0

    .line 1025
    :goto_0
    return-object v2

    .line 942
    :cond_1
    const-string v3, "Public-Lines"

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v14

    .line 943
    invoke-static {v10, v14}, Lcom/jcraft/jsch/KeyPair;->parseLines(Lcom/jcraft/jsch/Buffer;I)[B

    move-result-object v18

    .line 946
    :cond_2
    move-object/from16 v0, v20

    invoke-static {v10, v0}, Lcom/jcraft/jsch/KeyPair;->parseHeader(Lcom/jcraft/jsch/Buffer;Ljava/util/Hashtable;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 950
    const-string v3, "Private-Lines"

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v14

    .line 951
    invoke-static {v10, v14}, Lcom/jcraft/jsch/KeyPair;->parseLines(Lcom/jcraft/jsch/Buffer;I)[B

    move-result-object v16

    .line 954
    :cond_3
    move-object/from16 v0, v20

    invoke-static {v10, v0}, Lcom/jcraft/jsch/KeyPair;->parseHeader(Lcom/jcraft/jsch/Buffer;Ljava/util/Hashtable;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 958
    const/4 v3, 0x0

    move-object/from16 v0, v16

    array-length v8, v0

    move-object/from16 v0, v16

    invoke-static {v0, v3, v8}, Lcom/jcraft/jsch/Util;->fromBase64([BII)[B

    move-result-object v16

    .line 959
    const/4 v3, 0x0

    move-object/from16 v0, v18

    array-length v8, v0

    move-object/from16 v0, v18

    invoke-static {v0, v3, v8}, Lcom/jcraft/jsch/Util;->fromBase64([BII)[B

    move-result-object v18

    .line 961
    const/4 v2, 0x0

    .line 963
    .local v2, kpair:Lcom/jcraft/jsch/KeyPair;
    const-string v3, "ssh-rsa"

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 965
    new-instance v9, Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, v18

    invoke-direct {v9, v0}, Lcom/jcraft/jsch/Buffer;-><init>([B)V

    .line 966
    .local v9, _buf:Lcom/jcraft/jsch/Buffer;
    move-object/from16 v0, v18

    array-length v3, v0

    invoke-virtual {v9, v3}, Lcom/jcraft/jsch/Buffer;->skip(I)V

    .line 968
    invoke-virtual {v9}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v13

    .line 969
    .local v13, len:I
    new-array v3, v13, [B

    invoke-virtual {v9, v3}, Lcom/jcraft/jsch/Buffer;->getByte([B)V

    .line 970
    invoke-virtual {v9}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v3

    new-array v0, v3, [B

    move-object/from16 v17, v0

    .line 971
    .local v17, pub_array:[B
    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Lcom/jcraft/jsch/Buffer;->getByte([B)V

    .line 972
    invoke-virtual {v9}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v3

    new-array v15, v3, [B

    .line 973
    .local v15, n_array:[B
    invoke-virtual {v9, v15}, Lcom/jcraft/jsch/Buffer;->getByte([B)V

    .line 975
    new-instance v2, Lcom/jcraft/jsch/KeyPairRSA;

    .end local v2           #kpair:Lcom/jcraft/jsch/KeyPair;
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v2, v0, v15, v1, v3}, Lcom/jcraft/jsch/KeyPairRSA;-><init>(Lcom/jcraft/jsch/JSch;[B[B[B)V

    .line 999
    .end local v15           #n_array:[B
    .end local v17           #pub_array:[B
    .restart local v2       #kpair:Lcom/jcraft/jsch/KeyPair;
    :goto_1
    if-nez v2, :cond_6

    .line 1000
    const/4 v2, 0x0

    goto/16 :goto_0

    .line 977
    .end local v9           #_buf:Lcom/jcraft/jsch/Buffer;
    .end local v13           #len:I
    :cond_4
    const-string v3, "ssh-dss"

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 978
    new-instance v9, Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, v18

    invoke-direct {v9, v0}, Lcom/jcraft/jsch/Buffer;-><init>([B)V

    .line 979
    .restart local v9       #_buf:Lcom/jcraft/jsch/Buffer;
    move-object/from16 v0, v18

    array-length v3, v0

    invoke-virtual {v9, v3}, Lcom/jcraft/jsch/Buffer;->skip(I)V

    .line 981
    invoke-virtual {v9}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v13

    .line 982
    .restart local v13       #len:I
    new-array v3, v13, [B

    invoke-virtual {v9, v3}, Lcom/jcraft/jsch/Buffer;->getByte([B)V

    .line 984
    invoke-virtual {v9}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v3

    new-array v4, v3, [B

    .line 985
    .local v4, p_array:[B
    invoke-virtual {v9, v4}, Lcom/jcraft/jsch/Buffer;->getByte([B)V

    .line 986
    invoke-virtual {v9}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v3

    new-array v5, v3, [B

    .line 987
    .local v5, q_array:[B
    invoke-virtual {v9, v5}, Lcom/jcraft/jsch/Buffer;->getByte([B)V

    .line 988
    invoke-virtual {v9}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v3

    new-array v6, v3, [B

    .line 989
    .local v6, g_array:[B
    invoke-virtual {v9, v6}, Lcom/jcraft/jsch/Buffer;->getByte([B)V

    .line 990
    invoke-virtual {v9}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v3

    new-array v7, v3, [B

    .line 991
    .local v7, y_array:[B
    invoke-virtual {v9, v7}, Lcom/jcraft/jsch/Buffer;->getByte([B)V

    .line 993
    new-instance v2, Lcom/jcraft/jsch/KeyPairDSA;

    .end local v2           #kpair:Lcom/jcraft/jsch/KeyPair;
    const/4 v8, 0x0

    move-object/from16 v3, p0

    invoke-direct/range {v2 .. v8}, Lcom/jcraft/jsch/KeyPairDSA;-><init>(Lcom/jcraft/jsch/JSch;[B[B[B[B[B)V

    .line 994
    .restart local v2       #kpair:Lcom/jcraft/jsch/KeyPair;
    goto :goto_1

    .line 996
    .end local v4           #p_array:[B
    .end local v5           #q_array:[B
    .end local v6           #g_array:[B
    .end local v7           #y_array:[B
    .end local v9           #_buf:Lcom/jcraft/jsch/Buffer;
    .end local v13           #len:I
    :cond_5
    const/4 v2, 0x0

    goto/16 :goto_0

    .line 1002
    .restart local v9       #_buf:Lcom/jcraft/jsch/Buffer;
    .restart local v13       #len:I
    :cond_6
    const-string v3, "Encryption"

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const-string v8, "none"

    invoke-virtual {v3, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7

    const/4 v3, 0x1

    :goto_2
    iput-boolean v3, v2, Lcom/jcraft/jsch/KeyPair;->encrypted:Z

    .line 1003
    const/4 v3, 0x2

    iput v3, v2, Lcom/jcraft/jsch/KeyPair;->vendor:I

    .line 1004
    const-string v3, "Comment"

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, v2, Lcom/jcraft/jsch/KeyPair;->publicKeyComment:Ljava/lang/String;

    .line 1005
    iget-boolean v3, v2, Lcom/jcraft/jsch/KeyPair;->encrypted:Z

    if-eqz v3, :cond_9

    .line 1006
    const-string v3, "aes256-cbc"

    invoke-static {v3}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/jcraft/jsch/Session;->checkCipher(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 1008
    :try_start_0
    const-string v3, "aes256-cbc"

    invoke-static {v3}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v11

    .line 1009
    .local v11, c:Ljava/lang/Class;
    invoke-virtual {v11}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/jcraft/jsch/Cipher;

    check-cast v3, Lcom/jcraft/jsch/Cipher;

    iput-object v3, v2, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    .line 1010
    iget-object v3, v2, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    invoke-interface {v3}, Lcom/jcraft/jsch/Cipher;->getIVSize()I

    move-result v3

    new-array v3, v3, [B

    iput-object v3, v2, Lcom/jcraft/jsch/KeyPair;->iv:[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1019
    move-object/from16 v0, v16

    iput-object v0, v2, Lcom/jcraft/jsch/KeyPair;->data:[B

    goto/16 :goto_0

    .line 1002
    .end local v11           #c:Ljava/lang/Class;
    :cond_7
    const/4 v3, 0x0

    goto :goto_2

    .line 1012
    :catch_0
    move-exception v12

    .line 1013
    .local v12, e:Ljava/lang/Exception;
    new-instance v3, Lcom/jcraft/jsch/JSchException;

    const-string v8, "The cipher \'aes256-cbc\' is required, but it is not available."

    invoke-direct {v3, v8}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1017
    .end local v12           #e:Ljava/lang/Exception;
    :cond_8
    new-instance v3, Lcom/jcraft/jsch/JSchException;

    const-string v8, "The cipher \'aes256-cbc\' is required, but it is not available."

    invoke-direct {v3, v8}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1022
    :cond_9
    move-object/from16 v0, v16

    iput-object v0, v2, Lcom/jcraft/jsch/KeyPair;->data:[B

    .line 1023
    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Lcom/jcraft/jsch/KeyPair;->parse([B)Z

    goto/16 :goto_0
.end method

.method private static parseHeader(Lcom/jcraft/jsch/Buffer;Ljava/util/Hashtable;)Z
    .locals 9
    .parameter "buffer"
    .parameter "v"

    .prologue
    const/16 v8, 0xd

    const/4 v5, 0x0

    .line 1063
    iget-object v0, p0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    .line 1064
    .local v0, buf:[B
    iget v2, p0, Lcom/jcraft/jsch/Buffer;->index:I

    .line 1065
    .local v2, index:I
    const/4 v3, 0x0

    .line 1066
    .local v3, key:Ljava/lang/String;
    const/4 v4, 0x0

    .line 1067
    .local v4, value:Ljava/lang/String;
    move v1, v2

    .local v1, i:I
    :goto_0
    array-length v6, v0

    if-ge v1, v6, :cond_0

    .line 1068
    aget-byte v6, v0, v1

    if-ne v6, v8, :cond_2

    .line 1082
    :cond_0
    :goto_1
    if-nez v3, :cond_5

    .line 1102
    :cond_1
    :goto_2
    return v5

    .line 1071
    :cond_2
    aget-byte v6, v0, v1

    const/16 v7, 0x3a

    if-ne v6, v7, :cond_4

    .line 1072
    new-instance v3, Ljava/lang/String;

    .end local v3           #key:Ljava/lang/String;
    sub-int v6, v1, v2

    invoke-direct {v3, v0, v2, v6}, Ljava/lang/String;-><init>([BII)V

    .line 1073
    .restart local v3       #key:Ljava/lang/String;
    add-int/lit8 v1, v1, 0x1

    .line 1074
    array-length v6, v0

    if-ge v1, v6, :cond_3

    aget-byte v6, v0, v1

    const/16 v7, 0x20

    if-ne v6, v7, :cond_3

    .line 1075
    add-int/lit8 v1, v1, 0x1

    .line 1077
    :cond_3
    move v2, v1

    .line 1078
    goto :goto_1

    .line 1067
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1085
    :cond_5
    move v1, v2

    :goto_3
    array-length v6, v0

    if-ge v1, v6, :cond_7

    .line 1086
    aget-byte v6, v0, v1

    if-ne v6, v8, :cond_9

    .line 1087
    new-instance v4, Ljava/lang/String;

    .end local v4           #value:Ljava/lang/String;
    sub-int v6, v1, v2

    invoke-direct {v4, v0, v2, v6}, Ljava/lang/String;-><init>([BII)V

    .line 1088
    .restart local v4       #value:Ljava/lang/String;
    add-int/lit8 v1, v1, 0x1

    .line 1089
    array-length v6, v0

    if-ge v1, v6, :cond_6

    aget-byte v6, v0, v1

    const/16 v7, 0xa

    if-ne v6, v7, :cond_6

    .line 1090
    add-int/lit8 v1, v1, 0x1

    .line 1092
    :cond_6
    move v2, v1

    .line 1097
    :cond_7
    if-eqz v4, :cond_8

    .line 1098
    invoke-virtual {p1, v3, v4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1099
    iput v2, p0, Lcom/jcraft/jsch/Buffer;->index:I

    .line 1102
    :cond_8
    if-eqz v3, :cond_1

    if-eqz v4, :cond_1

    const/4 v5, 0x1

    goto :goto_2

    .line 1085
    :cond_9
    add-int/lit8 v1, v1, 0x1

    goto :goto_3
.end method

.method private static parseLines(Lcom/jcraft/jsch/Buffer;I)[B
    .locals 11
    .parameter "buffer"
    .parameter "lines"

    .prologue
    const/4 v10, 0x0

    .line 1029
    iget-object v0, p0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    .line 1030
    .local v0, buf:[B
    iget v4, p0, Lcom/jcraft/jsch/Buffer;->index:I

    .line 1031
    .local v4, index:I
    const/4 v1, 0x0

    .line 1033
    .local v1, data:[B
    move v2, v4

    .local v2, i:I
    move v6, p1

    .line 1034
    .end local p1
    .local v6, lines:I
    :goto_0
    add-int/lit8 p1, v6, -0x1

    .end local v6           #lines:I
    .restart local p1
    if-lez v6, :cond_4

    .line 1035
    :goto_1
    array-length v8, v0

    if-le v8, v2, :cond_0

    .line 1036
    add-int/lit8 v3, v2, 0x1

    .end local v2           #i:I
    .local v3, i:I
    aget-byte v8, v0, v2

    const/16 v9, 0xd

    if-ne v8, v9, :cond_6

    .line 1037
    if-nez v1, :cond_2

    .line 1038
    sub-int v8, v3, v4

    add-int/lit8 v8, v8, -0x1

    new-array v1, v8, [B

    .line 1039
    sub-int v8, v3, v4

    add-int/lit8 v8, v8, -0x1

    invoke-static {v0, v4, v1, v10, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move v2, v3

    .line 1051
    .end local v3           #i:I
    .restart local v2       #i:I
    :cond_0
    :goto_2
    aget-byte v8, v0, v2

    const/16 v9, 0xa

    if-ne v8, v9, :cond_1

    .line 1052
    add-int/lit8 v2, v2, 0x1

    .line 1053
    :cond_1
    move v4, v2

    move v6, p1

    .end local p1
    .restart local v6       #lines:I
    goto :goto_0

    .line 1042
    .end local v2           #i:I
    .end local v6           #lines:I
    .restart local v3       #i:I
    .restart local p1
    :cond_2
    array-length v8, v1

    add-int/2addr v8, v3

    sub-int/2addr v8, v4

    add-int/lit8 v8, v8, -0x1

    new-array v7, v8, [B

    .line 1043
    .local v7, tmp:[B
    array-length v8, v1

    invoke-static {v1, v10, v7, v10, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1044
    array-length v8, v1

    sub-int v9, v3, v4

    add-int/lit8 v9, v9, -0x1

    invoke-static {v0, v4, v7, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1045
    const/4 v5, 0x0

    .local v5, j:I
    :goto_3
    array-length v8, v1

    if-ge v5, v8, :cond_3

    aput-byte v10, v1, v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 1046
    :cond_3
    move-object v1, v7

    move v2, v3

    .line 1048
    .end local v3           #i:I
    .restart local v2       #i:I
    goto :goto_2

    .line 1056
    .end local v5           #j:I
    .end local v7           #tmp:[B
    :cond_4
    if-eqz v1, :cond_5

    .line 1057
    iput v4, p0, Lcom/jcraft/jsch/Buffer;->index:I

    .line 1059
    :cond_5
    return-object v1

    .end local v2           #i:I
    .restart local v3       #i:I
    :cond_6
    move v2, v3

    .end local v3           #i:I
    .restart local v2       #i:I
    goto :goto_1
.end method


# virtual methods
.method countLength(I)I
    .locals 3
    .parameter "len"

    .prologue
    .line 342
    const/4 v0, 0x1

    .line 343
    .local v0, i:I
    const/16 v2, 0x7f

    if-gt p1, v2, :cond_0

    move v1, v0

    .line 348
    .end local v0           #i:I
    .local v1, i:I
    :goto_0
    return v1

    .line 344
    .end local v1           #i:I
    .restart local v0       #i:I
    :cond_0
    :goto_1
    if-lez p1, :cond_1

    .line 345
    ushr-int/lit8 p1, p1, 0x8

    .line 346
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    move v1, v0

    .line 348
    .end local v0           #i:I
    .restart local v1       #i:I
    goto :goto_0
.end method

.method public decrypt(Ljava/lang/String;)Z
    .locals 1
    .parameter "_passphrase"

    .prologue
    .line 484
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_2

    .line 485
    :cond_0
    iget-boolean v0, p0, Lcom/jcraft/jsch/KeyPair;->encrypted:Z

    if-nez v0, :cond_1

    const/4 v0, 0x1

    .line 487
    :goto_0
    return v0

    .line 485
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 487
    :cond_2
    invoke-static {p1}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/KeyPair;->decrypt([B)Z

    move-result v0

    goto :goto_0
.end method

.method public decrypt([B)Z
    .locals 6
    .parameter "_passphrase"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 491
    iget-boolean v4, p0, Lcom/jcraft/jsch/KeyPair;->encrypted:Z

    if-nez v4, :cond_1

    .line 505
    :cond_0
    :goto_0
    return v2

    .line 494
    :cond_1
    if-nez p1, :cond_2

    .line 495
    iget-boolean v4, p0, Lcom/jcraft/jsch/KeyPair;->encrypted:Z

    if-eqz v4, :cond_0

    move v2, v3

    goto :goto_0

    .line 497
    :cond_2
    array-length v4, p1

    new-array v0, v4, [B

    .line 498
    .local v0, bar:[B
    array-length v4, v0

    invoke-static {p1, v3, v0, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 499
    move-object p1, v0

    .line 500
    iget-object v4, p0, Lcom/jcraft/jsch/KeyPair;->data:[B

    iget-object v5, p0, Lcom/jcraft/jsch/KeyPair;->iv:[B

    invoke-direct {p0, v4, p1, v5}, Lcom/jcraft/jsch/KeyPair;->decrypt([B[B[B)[B

    move-result-object v1

    .line 501
    .local v1, foo:[B
    invoke-static {p1}, Lcom/jcraft/jsch/Util;->bzero([B)V

    .line 502
    invoke-virtual {p0, v1}, Lcom/jcraft/jsch/KeyPair;->parse([B)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 503
    iput-boolean v3, p0, Lcom/jcraft/jsch/KeyPair;->encrypted:Z

    .line 505
    :cond_3
    iget-boolean v4, p0, Lcom/jcraft/jsch/KeyPair;->encrypted:Z

    if-eqz v4, :cond_0

    move v2, v3

    goto :goto_0
.end method

.method public dispose()V
    .locals 1

    .prologue
    .line 902
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPair;->passphrase:[B

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->bzero([B)V

    .line 903
    return-void
.end method

.method public finalize()V
    .locals 0

    .prologue
    .line 906
    invoke-virtual {p0}, Lcom/jcraft/jsch/KeyPair;->dispose()V

    .line 907
    return-void
.end method

.method public abstract forSSHAgent()[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation
.end method

.method declared-synchronized genKey([B[B)[B
    .locals 14
    .parameter "passphrase"
    .parameter "iv"

    .prologue
    .line 406
    monitor-enter p0

    :try_start_0
    iget-object v10, p0, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    if-nez v10, :cond_0

    invoke-direct {p0}, Lcom/jcraft/jsch/KeyPair;->genCipher()Lcom/jcraft/jsch/Cipher;

    move-result-object v10

    iput-object v10, p0, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    .line 407
    :cond_0
    iget-object v10, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    if-nez v10, :cond_1

    invoke-direct {p0}, Lcom/jcraft/jsch/KeyPair;->genHash()Lcom/jcraft/jsch/HASH;

    move-result-object v10

    iput-object v10, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    .line 409
    :cond_1
    iget-object v10, p0, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    invoke-interface {v10}, Lcom/jcraft/jsch/Cipher;->getBlockSize()I

    move-result v10

    new-array v7, v10, [B

    .line 410
    .local v7, key:[B
    iget-object v10, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    invoke-interface {v10}, Lcom/jcraft/jsch/HASH;->getBlockSize()I

    move-result v4

    .line 411
    .local v4, hsize:I
    array-length v10, v7

    div-int/2addr v10, v4

    mul-int v11, v10, v4

    array-length v10, v7

    rem-int/2addr v10, v4

    if-nez v10, :cond_3

    const/4 v10, 0x0

    :goto_0
    add-int/2addr v10, v11

    new-array v3, v10, [B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 414
    .local v3, hn:[B
    const/4 v9, 0x0

    .line 415
    .local v9, tmp:[B
    :try_start_1
    iget v10, p0, Lcom/jcraft/jsch/KeyPair;->vendor:I

    if-nez v10, :cond_7

    .line 416
    const/4 v6, 0x0

    .local v6, index:I
    :goto_1
    add-int v10, v6, v4

    array-length v11, v3

    if-gt v10, v11, :cond_5

    .line 417
    if-eqz v9, :cond_2

    iget-object v10, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    const/4 v11, 0x0

    array-length v12, v9

    invoke-interface {v10, v9, v11, v12}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 418
    :cond_2
    iget-object v10, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    const/4 v11, 0x0

    array-length v12, p1

    invoke-interface {v10, p1, v11, v12}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 419
    iget-object v11, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    const/4 v12, 0x0

    move-object/from16 v0, p2

    array-length v10, v0

    const/16 v13, 0x8

    if-le v10, v13, :cond_4

    const/16 v10, 0x8

    :goto_2
    move-object/from16 v0, p2

    invoke-interface {v11, v0, v12, v10}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 420
    iget-object v10, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    invoke-interface {v10}, Lcom/jcraft/jsch/HASH;->digest()[B

    move-result-object v9

    .line 421
    const/4 v10, 0x0

    array-length v11, v9

    invoke-static {v9, v10, v3, v6, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 422
    array-length v10, v9

    add-int/2addr v6, v10

    goto :goto_1

    .end local v3           #hn:[B
    .end local v6           #index:I
    .end local v9           #tmp:[B
    :cond_3
    move v10, v4

    .line 411
    goto :goto_0

    .line 419
    .restart local v3       #hn:[B
    .restart local v6       #index:I
    .restart local v9       #tmp:[B
    :cond_4
    move-object/from16 v0, p2

    array-length v10, v0

    goto :goto_2

    .line 424
    :cond_5
    const/4 v10, 0x0

    const/4 v11, 0x0

    array-length v12, v7

    invoke-static {v3, v10, v7, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 453
    .end local v6           #index:I
    :cond_6
    :goto_3
    monitor-exit p0

    return-object v7

    .line 426
    :cond_7
    :try_start_2
    iget v10, p0, Lcom/jcraft/jsch/KeyPair;->vendor:I

    const/4 v11, 0x1

    if-ne v10, v11, :cond_a

    .line 427
    const/4 v6, 0x0

    .restart local v6       #index:I
    :goto_4
    add-int v10, v6, v4

    array-length v11, v3

    if-gt v10, v11, :cond_9

    .line 428
    if-eqz v9, :cond_8

    iget-object v10, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    const/4 v11, 0x0

    array-length v12, v9

    invoke-interface {v10, v9, v11, v12}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 429
    :cond_8
    iget-object v10, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    const/4 v11, 0x0

    array-length v12, p1

    invoke-interface {v10, p1, v11, v12}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 430
    iget-object v10, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    invoke-interface {v10}, Lcom/jcraft/jsch/HASH;->digest()[B

    move-result-object v9

    .line 431
    const/4 v10, 0x0

    array-length v11, v9

    invoke-static {v9, v10, v3, v6, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 432
    array-length v10, v9

    add-int/2addr v6, v10

    goto :goto_4

    .line 434
    :cond_9
    const/4 v10, 0x0

    const/4 v11, 0x0

    array-length v12, v7

    invoke-static {v3, v10, v7, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_3

    .line 450
    .end local v6           #index:I
    :catch_0
    move-exception v2

    .line 451
    .local v2, e:Ljava/lang/Exception;
    :try_start_3
    sget-object v10, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v10, v2}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_3

    .line 406
    .end local v2           #e:Ljava/lang/Exception;
    .end local v3           #hn:[B
    .end local v4           #hsize:I
    .end local v7           #key:[B
    .end local v9           #tmp:[B
    :catchall_0
    move-exception v10

    monitor-exit p0

    throw v10

    .line 436
    .restart local v3       #hn:[B
    .restart local v4       #hsize:I
    .restart local v7       #key:[B
    .restart local v9       #tmp:[B
    :cond_a
    :try_start_4
    iget v10, p0, Lcom/jcraft/jsch/KeyPair;->vendor:I

    const/4 v11, 0x2

    if-ne v10, v11, :cond_6

    .line 437
    iget-object v10, p0, Lcom/jcraft/jsch/KeyPair;->jsch:Lcom/jcraft/jsch/JSch;

    const-string v10, "sha-1"

    invoke-static {v10}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 438
    .local v1, c:Ljava/lang/Class;
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/jcraft/jsch/HASH;

    move-object v0, v10

    check-cast v0, Lcom/jcraft/jsch/HASH;

    move-object v8, v0

    .line 439
    .local v8, sha1:Lcom/jcraft/jsch/HASH;
    const/4 v10, 0x4

    new-array v9, v10, [B

    .line 440
    const/16 v10, 0x28

    new-array v7, v10, [B

    .line 441
    const/4 v5, 0x0

    .local v5, i:I
    :goto_5
    const/4 v10, 0x2

    if-ge v5, v10, :cond_6

    .line 442
    invoke-interface {v8}, Lcom/jcraft/jsch/HASH;->init()V

    .line 443
    const/4 v10, 0x3

    int-to-byte v11, v5

    aput-byte v11, v9, v10

    .line 444
    const/4 v10, 0x0

    array-length v11, v9

    invoke-interface {v8, v9, v10, v11}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 445
    const/4 v10, 0x0

    array-length v11, p1

    invoke-interface {v8, p1, v10, v11}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 446
    invoke-interface {v8}, Lcom/jcraft/jsch/HASH;->digest()[B

    move-result-object v10

    const/4 v11, 0x0

    mul-int/lit8 v12, v5, 0x14

    const/16 v13, 0x14

    invoke-static {v10, v11, v7, v12, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 441
    add-int/lit8 v5, v5, 0x1

    goto :goto_5
.end method

.method abstract generate(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation
.end method

.method abstract getBegin()[B
.end method

.method abstract getEnd()[B
.end method

.method public getFingerPrint()Ljava/lang/String;
    .locals 2

    .prologue
    .line 268
    iget-object v1, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    if-nez v1, :cond_0

    invoke-direct {p0}, Lcom/jcraft/jsch/KeyPair;->genHash()Lcom/jcraft/jsch/HASH;

    move-result-object v1

    iput-object v1, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    .line 269
    :cond_0
    invoke-virtual {p0}, Lcom/jcraft/jsch/KeyPair;->getPublicKeyBlob()[B

    move-result-object v0

    .line 270
    .local v0, kblob:[B
    if-nez v0, :cond_1

    const/4 v1, 0x0

    .line 271
    :goto_0
    return-object v1

    :cond_1
    iget-object v1, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    invoke-static {v1, v0}, Lcom/jcraft/jsch/Util;->getFingerPrint(Lcom/jcraft/jsch/HASH;[B)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method abstract getKeySize()I
.end method

.method public abstract getKeyType()I
.end method

.method abstract getKeyTypeName()[B
.end method

.method abstract getPrivateKey()[B
.end method

.method public getPublicKeyBlob()[B
    .locals 1

    .prologue
    .line 171
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPair;->publickeyblob:[B

    return-object v0
.end method

.method public getPublicKeyComment()Ljava/lang/String;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPair;->publicKeyComment:Ljava/lang/String;

    return-object v0
.end method

.method public abstract getSignature([B)[B
.end method

.method public abstract getVerifier()Lcom/jcraft/jsch/Signature;
.end method

.method public isEncrypted()Z
    .locals 1

    .prologue
    .line 482
    iget-boolean v0, p0, Lcom/jcraft/jsch/KeyPair;->encrypted:Z

    return v0
.end method

.method abstract parse([B)Z
.end method

.method public setPassphrase(Ljava/lang/String;)V
    .locals 1
    .parameter "passphrase"

    .prologue
    .line 460
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 461
    :cond_0
    const/4 v0, 0x0

    check-cast v0, [B

    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/KeyPair;->setPassphrase([B)V

    .line 466
    :goto_0
    return-void

    .line 464
    :cond_1
    invoke-static {p1}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/KeyPair;->setPassphrase([B)V

    goto :goto_0
.end method

.method public setPassphrase([B)V
    .locals 1
    .parameter "passphrase"

    .prologue
    .line 472
    if-eqz p1, :cond_0

    array-length v0, p1

    if-nez v0, :cond_0

    .line 473
    const/4 p1, 0x0

    .line 474
    :cond_0
    iput-object p1, p0, Lcom/jcraft/jsch/KeyPair;->passphrase:[B

    .line 475
    return-void
.end method

.method public setPublicKeyComment(Ljava/lang/String;)V
    .locals 0
    .parameter "publicKeyComment"

    .prologue
    .line 80
    iput-object p1, p0, Lcom/jcraft/jsch/KeyPair;->publicKeyComment:Ljava/lang/String;

    .line 81
    return-void
.end method

.method writeINTEGER([BI[B)I
    .locals 3
    .parameter "buf"
    .parameter "index"
    .parameter "data"

    .prologue
    .line 334
    add-int/lit8 v0, p2, 0x1

    .end local p2
    .local v0, index:I
    const/4 v1, 0x2

    aput-byte v1, p1, p2

    .line 335
    array-length v1, p3

    invoke-virtual {p0, p1, v0, v1}, Lcom/jcraft/jsch/KeyPair;->writeLength([BII)I

    move-result p2

    .line 336
    .end local v0           #index:I
    .restart local p2
    const/4 v1, 0x0

    array-length v2, p3

    invoke-static {p3, v1, p1, p2, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 337
    array-length v1, p3

    add-int/2addr p2, v1

    .line 338
    return p2
.end method

.method writeLength([BII)I
    .locals 5
    .parameter "data"
    .parameter "index"
    .parameter "len"

    .prologue
    .line 352
    invoke-virtual {p0, p3}, Lcom/jcraft/jsch/KeyPair;->countLength(I)I

    move-result v3

    add-int/lit8 v0, v3, -0x1

    .line 353
    .local v0, i:I
    if-nez v0, :cond_0

    .line 354
    add-int/lit8 v1, p2, 0x1

    .end local p2
    .local v1, index:I
    int-to-byte v3, p3

    aput-byte v3, p1, p2

    move p2, v1

    .line 364
    .end local v1           #index:I
    .restart local p2
    :goto_0
    return v1

    .line 357
    :cond_0
    add-int/lit8 v1, p2, 0x1

    .end local p2
    .restart local v1       #index:I
    or-int/lit16 v3, v0, 0x80

    int-to-byte v3, v3

    aput-byte v3, p1, p2

    .line 358
    add-int v2, v1, v0

    .line 359
    .local v2, j:I
    :goto_1
    if-lez v0, :cond_1

    .line 360
    add-int v3, v1, v0

    add-int/lit8 v3, v3, -0x1

    and-int/lit16 v4, p3, 0xff

    int-to-byte v4, v4

    aput-byte v4, p1, v3

    .line 361
    ushr-int/lit8 p3, p3, 0x8

    .line 362
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_1
    move p2, v1

    .end local v1           #index:I
    .restart local p2
    move v1, v2

    .line 364
    goto :goto_0
.end method

.method public writePrivateKey(Ljava/io/OutputStream;)V
    .locals 1
    .parameter "out"

    .prologue
    .line 107
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/jcraft/jsch/KeyPair;->writePrivateKey(Ljava/io/OutputStream;[B)V

    .line 108
    return-void
.end method

.method public writePrivateKey(Ljava/io/OutputStream;[B)V
    .locals 8
    .parameter "out"
    .parameter "passphrase"

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 116
    if-nez p2, :cond_0

    .line 117
    iget-object p2, p0, Lcom/jcraft/jsch/KeyPair;->passphrase:[B

    .line 119
    :cond_0
    invoke-virtual {p0}, Lcom/jcraft/jsch/KeyPair;->getPrivateKey()[B

    move-result-object v4

    .line 120
    .local v4, plain:[B
    new-array v0, v6, [[B

    .line 121
    .local v0, _iv:[[B
    invoke-direct {p0, v4, v0, p2}, Lcom/jcraft/jsch/KeyPair;->encrypt([B[[B[B)[B

    move-result-object v1

    .line 122
    .local v1, encoded:[B
    if-eq v1, v4, :cond_1

    .line 123
    invoke-static {v4}, Lcom/jcraft/jsch/Util;->bzero([B)V

    .line 124
    :cond_1
    aget-object v3, v0, v7

    .line 125
    .local v3, iv:[B
    array-length v6, v1

    invoke-static {v1, v7, v6}, Lcom/jcraft/jsch/Util;->toBase64([BII)[B

    move-result-object v5

    .line 128
    .local v5, prv:[B
    :try_start_0
    invoke-virtual {p0}, Lcom/jcraft/jsch/KeyPair;->getBegin()[B

    move-result-object v6

    invoke-virtual {p1, v6}, Ljava/io/OutputStream;->write([B)V

    sget-object v6, Lcom/jcraft/jsch/KeyPair;->cr:[B

    invoke-virtual {p1, v6}, Ljava/io/OutputStream;->write([B)V

    .line 129
    if-eqz p2, :cond_3

    .line 130
    sget-object v6, Lcom/jcraft/jsch/KeyPair;->header:[[B

    const/4 v7, 0x0

    aget-object v6, v6, v7

    invoke-virtual {p1, v6}, Ljava/io/OutputStream;->write([B)V

    sget-object v6, Lcom/jcraft/jsch/KeyPair;->cr:[B

    invoke-virtual {p1, v6}, Ljava/io/OutputStream;->write([B)V

    .line 131
    sget-object v6, Lcom/jcraft/jsch/KeyPair;->header:[[B

    const/4 v7, 0x1

    aget-object v6, v6, v7

    invoke-virtual {p1, v6}, Ljava/io/OutputStream;->write([B)V

    .line 132
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    array-length v6, v3

    if-ge v2, v6, :cond_2

    .line 133
    aget-byte v6, v3, v2

    ushr-int/lit8 v6, v6, 0x4

    and-int/lit8 v6, v6, 0xf

    int-to-byte v6, v6

    invoke-static {v6}, Lcom/jcraft/jsch/KeyPair;->b2a(B)B

    move-result v6

    invoke-virtual {p1, v6}, Ljava/io/OutputStream;->write(I)V

    .line 134
    aget-byte v6, v3, v2

    and-int/lit8 v6, v6, 0xf

    int-to-byte v6, v6

    invoke-static {v6}, Lcom/jcraft/jsch/KeyPair;->b2a(B)B

    move-result v6

    invoke-virtual {p1, v6}, Ljava/io/OutputStream;->write(I)V

    .line 132
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 136
    :cond_2
    sget-object v6, Lcom/jcraft/jsch/KeyPair;->cr:[B

    invoke-virtual {p1, v6}, Ljava/io/OutputStream;->write([B)V

    .line 137
    sget-object v6, Lcom/jcraft/jsch/KeyPair;->cr:[B

    invoke-virtual {p1, v6}, Ljava/io/OutputStream;->write([B)V

    .line 139
    .end local v2           #i:I
    :cond_3
    const/4 v2, 0x0

    .line 140
    .restart local v2       #i:I
    :goto_1
    array-length v6, v5

    if-ge v2, v6, :cond_5

    .line 141
    add-int/lit8 v6, v2, 0x40

    array-length v7, v5

    if-ge v6, v7, :cond_4

    .line 142
    const/16 v6, 0x40

    invoke-virtual {p1, v5, v2, v6}, Ljava/io/OutputStream;->write([BII)V

    .line 143
    sget-object v6, Lcom/jcraft/jsch/KeyPair;->cr:[B

    invoke-virtual {p1, v6}, Ljava/io/OutputStream;->write([B)V

    .line 144
    add-int/lit8 v2, v2, 0x40

    .line 145
    goto :goto_1

    .line 147
    :cond_4
    array-length v6, v5

    sub-int/2addr v6, v2

    invoke-virtual {p1, v5, v2, v6}, Ljava/io/OutputStream;->write([BII)V

    .line 148
    sget-object v6, Lcom/jcraft/jsch/KeyPair;->cr:[B

    invoke-virtual {p1, v6}, Ljava/io/OutputStream;->write([B)V

    .line 151
    :cond_5
    invoke-virtual {p0}, Lcom/jcraft/jsch/KeyPair;->getEnd()[B

    move-result-object v6

    invoke-virtual {p1, v6}, Ljava/io/OutputStream;->write([B)V

    sget-object v6, Lcom/jcraft/jsch/KeyPair;->cr:[B

    invoke-virtual {p1, v6}, Ljava/io/OutputStream;->write([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 156
    .end local v2           #i:I
    :goto_2
    return-void

    .line 154
    :catch_0
    move-exception v6

    goto :goto_2
.end method

.method public writePrivateKey(Ljava/lang/String;)V
    .locals 1
    .parameter "name"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 248
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/jcraft/jsch/KeyPair;->writePrivateKey(Ljava/lang/String;[B)V

    .line 249
    return-void
.end method

.method public writePrivateKey(Ljava/lang/String;[B)V
    .locals 1
    .parameter "name"
    .parameter "passphrase"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 258
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 259
    .local v0, fos:Ljava/io/FileOutputStream;
    invoke-virtual {p0, v0, p2}, Lcom/jcraft/jsch/KeyPair;->writePrivateKey(Ljava/io/OutputStream;[B)V

    .line 260
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 261
    return-void
.end method

.method public writePublicKey(Ljava/io/OutputStream;Ljava/lang/String;)V
    .locals 4
    .parameter "out"
    .parameter "comment"

    .prologue
    const/4 v3, 0x0

    .line 180
    invoke-virtual {p0}, Lcom/jcraft/jsch/KeyPair;->getPublicKeyBlob()[B

    move-result-object v1

    .line 181
    .local v1, pubblob:[B
    array-length v2, v1

    invoke-static {v1, v3, v2}, Lcom/jcraft/jsch/Util;->toBase64([BII)[B

    move-result-object v0

    .line 183
    .local v0, pub:[B
    :try_start_0
    invoke-virtual {p0}, Lcom/jcraft/jsch/KeyPair;->getKeyTypeName()[B

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write([B)V

    sget-object v2, Lcom/jcraft/jsch/KeyPair;->space:[B

    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 184
    const/4 v2, 0x0

    array-length v3, v0

    invoke-virtual {p1, v0, v2, v3}, Ljava/io/OutputStream;->write([BII)V

    sget-object v2, Lcom/jcraft/jsch/KeyPair;->space:[B

    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 185
    invoke-static {p2}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 186
    sget-object v2, Lcom/jcraft/jsch/KeyPair;->cr:[B

    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 190
    :goto_0
    return-void

    .line 188
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public writePublicKey(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "name"
    .parameter "comment"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 199
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 200
    .local v0, fos:Ljava/io/FileOutputStream;
    invoke-virtual {p0, v0, p2}, Lcom/jcraft/jsch/KeyPair;->writePublicKey(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 201
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 202
    return-void
.end method

.method public writeSECSHPublicKey(Ljava/io/OutputStream;Ljava/lang/String;)V
    .locals 6
    .parameter "out"
    .parameter "comment"

    .prologue
    .line 211
    invoke-virtual {p0}, Lcom/jcraft/jsch/KeyPair;->getPublicKeyBlob()[B

    move-result-object v3

    .line 212
    .local v3, pubblob:[B
    const/4 v4, 0x0

    array-length v5, v3

    invoke-static {v3, v4, v5}, Lcom/jcraft/jsch/Util;->toBase64([BII)[B

    move-result-object v2

    .line 214
    .local v2, pub:[B
    :try_start_0
    const-string v4, "---- BEGIN SSH2 PUBLIC KEY ----"

    invoke-static {v4}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/OutputStream;->write([B)V

    sget-object v4, Lcom/jcraft/jsch/KeyPair;->cr:[B

    invoke-virtual {p1, v4}, Ljava/io/OutputStream;->write([B)V

    .line 215
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Comment: \""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/OutputStream;->write([B)V

    sget-object v4, Lcom/jcraft/jsch/KeyPair;->cr:[B

    invoke-virtual {p1, v4}, Ljava/io/OutputStream;->write([B)V

    .line 216
    const/4 v0, 0x0

    .line 217
    .local v0, index:I
    :goto_0
    array-length v4, v2

    if-ge v0, v4, :cond_1

    .line 218
    const/16 v1, 0x46

    .line 219
    .local v1, len:I
    array-length v4, v2

    sub-int/2addr v4, v0

    if-ge v4, v1, :cond_0

    array-length v4, v2

    sub-int v1, v4, v0

    .line 220
    :cond_0
    invoke-virtual {p1, v2, v0, v1}, Ljava/io/OutputStream;->write([BII)V

    sget-object v4, Lcom/jcraft/jsch/KeyPair;->cr:[B

    invoke-virtual {p1, v4}, Ljava/io/OutputStream;->write([B)V

    .line 221
    add-int/2addr v0, v1

    .line 222
    goto :goto_0

    .line 223
    .end local v1           #len:I
    :cond_1
    const-string v4, "---- END SSH2 PUBLIC KEY ----"

    invoke-static {v4}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/OutputStream;->write([B)V

    sget-object v4, Lcom/jcraft/jsch/KeyPair;->cr:[B

    invoke-virtual {p1, v4}, Ljava/io/OutputStream;->write([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 227
    .end local v0           #index:I
    :goto_1
    return-void

    .line 225
    :catch_0
    move-exception v4

    goto :goto_1
.end method

.method public writeSECSHPublicKey(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "name"
    .parameter "comment"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 237
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 238
    .local v0, fos:Ljava/io/FileOutputStream;
    invoke-virtual {p0, v0, p2}, Lcom/jcraft/jsch/KeyPair;->writeSECSHPublicKey(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 239
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 240
    return-void
.end method

.method writeSEQUENCE([BII)I
    .locals 2
    .parameter "buf"
    .parameter "index"
    .parameter "len"

    .prologue
    .line 329
    add-int/lit8 v0, p2, 0x1

    .end local p2
    .local v0, index:I
    const/16 v1, 0x30

    aput-byte v1, p1, p2

    .line 330
    invoke-virtual {p0, p1, v0, p3}, Lcom/jcraft/jsch/KeyPair;->writeLength([BII)I

    move-result p2

    .line 331
    .end local v0           #index:I
    .restart local p2
    return p2
.end method
