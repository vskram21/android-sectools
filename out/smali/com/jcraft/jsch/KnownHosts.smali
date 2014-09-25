.class public Lcom/jcraft/jsch/KnownHosts;
.super Ljava/lang/Object;
.source "KnownHosts.java"

# interfaces
.implements Lcom/jcraft/jsch/HostKeyRepository;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jcraft/jsch/KnownHosts$HashedHostKey;
    }
.end annotation


# static fields
.field private static final _known_hosts:Ljava/lang/String; = "known_hosts"

.field private static final cr:[B

.field private static final space:[B


# instance fields
.field private hmacsha1:Lcom/jcraft/jsch/MAC;

.field private jsch:Lcom/jcraft/jsch/JSch;

.field private known_hosts:Ljava/lang/String;

.field private pool:Ljava/util/Vector;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 416
    const/4 v0, 0x1

    new-array v0, v0, [B

    const/4 v1, 0x0

    const/16 v2, 0x20

    aput-byte v2, v0, v1

    sput-object v0, Lcom/jcraft/jsch/KnownHosts;->space:[B

    .line 417
    const-string v0, "\n"

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/jcraft/jsch/KnownHosts;->cr:[B

    return-void
.end method

.method constructor <init>(Lcom/jcraft/jsch/JSch;)V
    .locals 1
    .parameter "jsch"

    .prologue
    const/4 v0, 0x0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object v0, p0, Lcom/jcraft/jsch/KnownHosts;->jsch:Lcom/jcraft/jsch/JSch;

    .line 45
    iput-object v0, p0, Lcom/jcraft/jsch/KnownHosts;->known_hosts:Ljava/lang/String;

    .line 46
    iput-object v0, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    .line 48
    iput-object v0, p0, Lcom/jcraft/jsch/KnownHosts;->hmacsha1:Lcom/jcraft/jsch/MAC;

    .line 52
    iput-object p1, p0, Lcom/jcraft/jsch/KnownHosts;->jsch:Lcom/jcraft/jsch/JSch;

    .line 53
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    .line 54
    return-void
.end method

.method static synthetic access$000(Lcom/jcraft/jsch/KnownHosts;)Lcom/jcraft/jsch/MAC;
    .locals 1
    .parameter "x0"

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/jcraft/jsch/KnownHosts;->getHMACSHA1()Lcom/jcraft/jsch/MAC;

    move-result-object v0

    return-object v0
.end method

.method private addInvalidLine(Ljava/lang/String;)V
    .locals 3
    .parameter "line"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 240
    new-instance v0, Lcom/jcraft/jsch/HostKey;

    const/4 v1, 0x3

    const/4 v2, 0x0

    invoke-direct {v0, p1, v1, v2}, Lcom/jcraft/jsch/HostKey;-><init>(Ljava/lang/String;I[B)V

    .line 241
    .local v0, hk:Lcom/jcraft/jsch/HostKey;
    iget-object v1, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 242
    return-void
.end method

.method private deleteSubString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .parameter "hosts"
    .parameter "host"

    .prologue
    const/4 v5, 0x0

    .line 461
    const/4 v2, 0x0

    .line 462
    .local v2, i:I
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    .line 463
    .local v0, hostlen:I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 465
    .local v1, hostslen:I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 466
    const/16 v4, 0x2c

    invoke-virtual {p1, v4, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    .line 467
    .local v3, j:I
    const/4 v4, -0x1

    if-ne v3, v4, :cond_2

    .line 474
    .end local v3           #j:I
    :cond_0
    invoke-virtual {p1, p2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    sub-int v4, v1, v2

    if-ne v4, v0, :cond_1

    .line 475
    if-ne v0, v1, :cond_4

    move v4, v5

    :goto_1
    invoke-virtual {p1, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 477
    .end local p1
    :cond_1
    :goto_2
    return-object p1

    .line 468
    .restart local v3       #j:I
    .restart local p1
    :cond_2
    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 469
    add-int/lit8 v2, v3, 0x1

    .line 470
    goto :goto_0

    .line 472
    :cond_3
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v5, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    add-int/lit8 v5, v3, 0x1

    invoke-virtual {p1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_2

    .line 475
    .end local v3           #j:I
    :cond_4
    sub-int v4, v1, v0

    add-int/lit8 v4, v4, -0x1

    goto :goto_1
.end method

.method private declared-synchronized getHMACSHA1()Lcom/jcraft/jsch/MAC;
    .locals 5

    .prologue
    .line 481
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lcom/jcraft/jsch/KnownHosts;->hmacsha1:Lcom/jcraft/jsch/MAC;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    .line 483
    :try_start_1
    iget-object v2, p0, Lcom/jcraft/jsch/KnownHosts;->jsch:Lcom/jcraft/jsch/JSch;

    const-string v2, "hmac-sha1"

    invoke-static {v2}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 484
    .local v0, c:Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/jcraft/jsch/MAC;

    check-cast v2, Lcom/jcraft/jsch/MAC;

    iput-object v2, p0, Lcom/jcraft/jsch/KnownHosts;->hmacsha1:Lcom/jcraft/jsch/MAC;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 490
    .end local v0           #c:Ljava/lang/Class;
    :cond_0
    :goto_0
    :try_start_2
    iget-object v2, p0, Lcom/jcraft/jsch/KnownHosts;->hmacsha1:Lcom/jcraft/jsch/MAC;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-object v2

    .line 486
    :catch_0
    move-exception v1

    .line 487
    .local v1, e:Ljava/lang/Exception;
    :try_start_3
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "hmacsha1: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 481
    .end local v1           #e:Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method private getType([B)I
    .locals 3
    .parameter "key"

    .prologue
    const/16 v2, 0x8

    .line 456
    aget-byte v0, p1, v2

    const/16 v1, 0x64

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    .line 458
    :goto_0
    return v0

    .line 457
    :cond_0
    aget-byte v0, p1, v2

    const/16 v1, 0x72

    if-ne v0, v1, :cond_1

    const/4 v0, 0x2

    goto :goto_0

    .line 458
    :cond_1
    const/4 v0, 0x3

    goto :goto_0
.end method


# virtual methods
.method public add(Lcom/jcraft/jsch/HostKey;Lcom/jcraft/jsch/UserInfo;)V
    .locals 13
    .parameter "hostkey"
    .parameter "userinfo"

    .prologue
    .line 280
    iget v9, p1, Lcom/jcraft/jsch/HostKey;->type:I

    .line 281
    .local v9, type:I
    invoke-virtual {p1}, Lcom/jcraft/jsch/HostKey;->getHost()Ljava/lang/String;

    move-result-object v6

    .line 282
    .local v6, host:Ljava/lang/String;
    iget-object v8, p1, Lcom/jcraft/jsch/HostKey;->key:[B

    .line 284
    .local v8, key:[B
    const/4 v5, 0x0

    .line 285
    .local v5, hk:Lcom/jcraft/jsch/HostKey;
    iget-object v11, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    monitor-enter v11

    .line 286
    const/4 v7, 0x0

    .local v7, i:I
    :goto_0
    :try_start_0
    iget-object v10, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v10}, Ljava/util/Vector;->size()I

    move-result v10

    if-ge v7, v10, :cond_1

    .line 287
    iget-object v10, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v10, v7}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/jcraft/jsch/HostKey;

    move-object v0, v10

    check-cast v0, Lcom/jcraft/jsch/HostKey;

    move-object v5, v0

    .line 288
    invoke-virtual {v5, v6}, Lcom/jcraft/jsch/HostKey;->isMatched(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_0

    iget v10, v5, Lcom/jcraft/jsch/HostKey;->type:I

    if-ne v10, v9, :cond_0

    .line 286
    :cond_0
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 302
    :cond_1
    monitor-exit v11
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 304
    move-object v5, p1

    .line 306
    iget-object v10, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v10, v5}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 308
    invoke-virtual {p0}, Lcom/jcraft/jsch/KnownHosts;->getKnownHostsRepositoryID()Ljava/lang/String;

    move-result-object v1

    .line 309
    .local v1, bar:Ljava/lang/String;
    if-eqz v1, :cond_4

    .line 310
    const/4 v3, 0x1

    .line 311
    .local v3, foo:Z
    new-instance v4, Ljava/io/File;

    invoke-static {v1}, Lcom/jcraft/jsch/Util;->checkTilde(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v4, v10}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 312
    .local v4, goo:Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v10

    if-nez v10, :cond_3

    .line 313
    const/4 v3, 0x0

    .line 314
    if-eqz p2, :cond_3

    .line 315
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " does not exist.\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "Are you sure you want to create it?"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {p2, v10}, Lcom/jcraft/jsch/UserInfo;->promptYesNo(Ljava/lang/String;)Z

    move-result v3

    .line 318
    invoke-virtual {v4}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    .line 319
    if-eqz v3, :cond_2

    if-eqz v4, :cond_2

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v10

    if-nez v10, :cond_2

    .line 320
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "The parent directory "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " does not exist.\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "Are you sure you want to create it?"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {p2, v10}, Lcom/jcraft/jsch/UserInfo;->promptYesNo(Ljava/lang/String;)Z

    move-result v3

    .line 323
    if-eqz v3, :cond_2

    .line 324
    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    move-result v10

    if-nez v10, :cond_5

    .line 325
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " has not been created."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {p2, v10}, Lcom/jcraft/jsch/UserInfo;->showMessage(Ljava/lang/String;)V

    .line 326
    const/4 v3, 0x0

    .line 333
    :cond_2
    :goto_1
    if-nez v4, :cond_3

    const/4 v3, 0x0

    .line 336
    :cond_3
    if-eqz v3, :cond_4

    .line 338
    :try_start_1
    invoke-virtual {p0, v1}, Lcom/jcraft/jsch/KnownHosts;->sync(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 343
    .end local v3           #foo:Z
    .end local v4           #goo:Ljava/io/File;
    :cond_4
    :goto_2
    return-void

    .line 302
    .end local v1           #bar:Ljava/lang/String;
    :catchall_0
    move-exception v10

    :try_start_2
    monitor-exit v11
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v10

    .line 329
    .restart local v1       #bar:Ljava/lang/String;
    .restart local v3       #foo:Z
    .restart local v4       #goo:Ljava/io/File;
    :cond_5
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " has been succesfully created.\nPlease check its access permission."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {p2, v10}, Lcom/jcraft/jsch/UserInfo;->showMessage(Ljava/lang/String;)V

    goto :goto_1

    .line 340
    :catch_0
    move-exception v2

    .local v2, e:Ljava/lang/Exception;
    sget-object v10, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "sync known_hosts: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_2
.end method

.method public check(Ljava/lang/String;[B)I
    .locals 8
    .parameter "host"
    .parameter "key"

    .prologue
    const/4 v7, 0x1

    .line 247
    const/4 v3, 0x1

    .line 248
    .local v3, result:I
    if-nez p1, :cond_0

    move v5, v3

    .line 276
    :goto_0
    return v5

    .line 252
    :cond_0
    invoke-direct {p0, p2}, Lcom/jcraft/jsch/KnownHosts;->getType([B)I

    move-result v4

    .line 255
    .local v4, type:I
    iget-object v6, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    monitor-enter v6

    .line 256
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1
    :try_start_0
    iget-object v5, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v5

    if-ge v2, v5, :cond_3

    .line 257
    iget-object v5, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v5, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/jcraft/jsch/HostKey;

    move-object v0, v5

    check-cast v0, Lcom/jcraft/jsch/HostKey;

    move-object v1, v0

    .line 258
    .local v1, hk:Lcom/jcraft/jsch/HostKey;
    invoke-virtual {v1, p1}, Lcom/jcraft/jsch/HostKey;->isMatched(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    iget v5, v1, Lcom/jcraft/jsch/HostKey;->type:I

    if-ne v5, v4, :cond_2

    .line 259
    iget-object v5, v1, Lcom/jcraft/jsch/HostKey;->key:[B

    invoke-static {v5, p2}, Lcom/jcraft/jsch/Util;->array_equals([B[B)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 260
    const/4 v5, 0x0

    monitor-exit v6

    goto :goto_0

    .line 267
    .end local v1           #hk:Lcom/jcraft/jsch/HostKey;
    :catchall_0
    move-exception v5

    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5

    .line 263
    .restart local v1       #hk:Lcom/jcraft/jsch/HostKey;
    :cond_1
    const/4 v3, 0x2

    .line 256
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 267
    .end local v1           #hk:Lcom/jcraft/jsch/HostKey;
    :cond_3
    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 269
    if-ne v3, v7, :cond_4

    const-string v5, "["

    invoke-virtual {p1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    const-string v5, "]:"

    invoke-virtual {p1, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-le v5, v7, :cond_4

    .line 273
    const-string v5, "]:"

    invoke-virtual {p1, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {p1, v7, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5, p2}, Lcom/jcraft/jsch/KnownHosts;->check(Ljava/lang/String;[B)I

    move-result v5

    goto :goto_0

    :cond_4
    move v5, v3

    .line 276
    goto :goto_0
.end method

.method createHashedHostKey(Ljava/lang/String;[B)Lcom/jcraft/jsch/HostKey;
    .locals 1
    .parameter "host"
    .parameter "key"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 494
    new-instance v0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;

    invoke-direct {v0, p0, p1, p2}, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;-><init>(Lcom/jcraft/jsch/KnownHosts;Ljava/lang/String;[B)V

    .line 495
    .local v0, hhk:Lcom/jcraft/jsch/KnownHosts$HashedHostKey;
    invoke-virtual {v0}, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hash()V

    .line 496
    return-object v0
.end method

.method dump(Ljava/io/OutputStream;)V
    .locals 10
    .parameter "out"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 421
    :try_start_0
    iget-object v9, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    monitor-enter v9
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 422
    const/4 v5, 0x0

    .local v5, i:I
    :goto_0
    :try_start_1
    iget-object v8, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v8}, Ljava/util/Vector;->size()I

    move-result v8

    if-ge v5, v8, :cond_3

    .line 423
    iget-object v8, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v8, v5}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/jcraft/jsch/HostKey;

    move-object v0, v8

    check-cast v0, Lcom/jcraft/jsch/HostKey;

    move-object v3, v0

    .line 425
    .local v3, hk:Lcom/jcraft/jsch/HostKey;
    invoke-virtual {v3}, Lcom/jcraft/jsch/HostKey;->getMarker()Ljava/lang/String;

    move-result-object v6

    .line 426
    .local v6, marker:Ljava/lang/String;
    invoke-virtual {v3}, Lcom/jcraft/jsch/HostKey;->getHost()Ljava/lang/String;

    move-result-object v4

    .line 427
    .local v4, host:Ljava/lang/String;
    invoke-virtual {v3}, Lcom/jcraft/jsch/HostKey;->getType()Ljava/lang/String;

    move-result-object v7

    .line 428
    .local v7, type:Ljava/lang/String;
    invoke-virtual {v3}, Lcom/jcraft/jsch/HostKey;->getComment()Ljava/lang/String;

    move-result-object v1

    .line 429
    .local v1, comment:Ljava/lang/String;
    const-string v8, "UNKNOWN"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 430
    invoke-static {v4}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v8

    invoke-virtual {p1, v8}, Ljava/io/OutputStream;->write([B)V

    .line 431
    sget-object v8, Lcom/jcraft/jsch/KnownHosts;->cr:[B

    invoke-virtual {p1, v8}, Ljava/io/OutputStream;->write([B)V

    .line 422
    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 434
    :cond_0
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    if-eqz v8, :cond_1

    .line 435
    invoke-static {v6}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v8

    invoke-virtual {p1, v8}, Ljava/io/OutputStream;->write([B)V

    .line 436
    sget-object v8, Lcom/jcraft/jsch/KnownHosts;->space:[B

    invoke-virtual {p1, v8}, Ljava/io/OutputStream;->write([B)V

    .line 438
    :cond_1
    invoke-static {v4}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v8

    invoke-virtual {p1, v8}, Ljava/io/OutputStream;->write([B)V

    .line 439
    sget-object v8, Lcom/jcraft/jsch/KnownHosts;->space:[B

    invoke-virtual {p1, v8}, Ljava/io/OutputStream;->write([B)V

    .line 440
    invoke-static {v7}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v8

    invoke-virtual {p1, v8}, Ljava/io/OutputStream;->write([B)V

    .line 441
    sget-object v8, Lcom/jcraft/jsch/KnownHosts;->space:[B

    invoke-virtual {p1, v8}, Ljava/io/OutputStream;->write([B)V

    .line 442
    invoke-virtual {v3}, Lcom/jcraft/jsch/HostKey;->getKey()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v8

    invoke-virtual {p1, v8}, Ljava/io/OutputStream;->write([B)V

    .line 443
    if-eqz v1, :cond_2

    .line 444
    sget-object v8, Lcom/jcraft/jsch/KnownHosts;->space:[B

    invoke-virtual {p1, v8}, Ljava/io/OutputStream;->write([B)V

    .line 445
    invoke-static {v1}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v8

    invoke-virtual {p1, v8}, Ljava/io/OutputStream;->write([B)V

    .line 447
    :cond_2
    sget-object v8, Lcom/jcraft/jsch/KnownHosts;->cr:[B

    invoke-virtual {p1, v8}, Ljava/io/OutputStream;->write([B)V

    goto :goto_1

    .line 449
    .end local v1           #comment:Ljava/lang/String;
    .end local v3           #hk:Lcom/jcraft/jsch/HostKey;
    .end local v4           #host:Ljava/lang/String;
    .end local v6           #marker:Ljava/lang/String;
    .end local v7           #type:Ljava/lang/String;
    :catchall_0
    move-exception v8

    monitor-exit v9
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v8
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 451
    .end local v5           #i:I
    :catch_0
    move-exception v2

    .line 452
    .local v2, e:Ljava/lang/Exception;
    sget-object v8, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v8, v2}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    .line 454
    .end local v2           #e:Ljava/lang/Exception;
    :goto_2
    return-void

    .line 449
    .restart local v5       #i:I
    :cond_3
    :try_start_3
    monitor-exit v9
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_2
.end method

.method public getHostKey()[Lcom/jcraft/jsch/HostKey;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 346
    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v1, v0}, Lcom/jcraft/jsch/KnownHosts;->getHostKey(Ljava/lang/String;Ljava/lang/String;)[Lcom/jcraft/jsch/HostKey;

    move-result-object v0

    return-object v0
.end method

.method public getHostKey(Ljava/lang/String;Ljava/lang/String;)[Lcom/jcraft/jsch/HostKey;
    .locals 9
    .parameter "host"
    .parameter "type"

    .prologue
    const/4 v8, 0x3

    .line 349
    iget-object v7, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    monitor-enter v7

    .line 350
    const/4 v0, 0x0

    .line 351
    .local v0, count:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    :try_start_0
    iget-object v6, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v6}, Ljava/util/Vector;->size()I

    move-result v6

    if-ge v3, v6, :cond_3

    .line 352
    iget-object v6, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v6, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/jcraft/jsch/HostKey;

    .line 353
    .local v2, hk:Lcom/jcraft/jsch/HostKey;
    iget v6, v2, Lcom/jcraft/jsch/HostKey;->type:I

    if-ne v6, v8, :cond_1

    .line 351
    :cond_0
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 354
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {v2, p1}, Lcom/jcraft/jsch/HostKey;->isMatched(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    if-eqz p2, :cond_2

    invoke-virtual {v2}, Lcom/jcraft/jsch/HostKey;->getType()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 357
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 360
    .end local v2           #hk:Lcom/jcraft/jsch/HostKey;
    :cond_3
    if-nez v0, :cond_4

    const/4 v1, 0x0

    monitor-exit v7

    .line 372
    :goto_2
    return-object v1

    .line 361
    :cond_4
    new-array v1, v0, [Lcom/jcraft/jsch/HostKey;

    .line 362
    .local v1, foo:[Lcom/jcraft/jsch/HostKey;
    const/4 v4, 0x0

    .line 363
    .local v4, j:I
    const/4 v3, 0x0

    move v5, v4

    .end local v4           #j:I
    .local v5, j:I
    :goto_3
    iget-object v6, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v6}, Ljava/util/Vector;->size()I

    move-result v6

    if-ge v3, v6, :cond_7

    .line 364
    iget-object v6, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v6, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/jcraft/jsch/HostKey;

    .line 365
    .restart local v2       #hk:Lcom/jcraft/jsch/HostKey;
    iget v6, v2, Lcom/jcraft/jsch/HostKey;->type:I

    if-ne v6, v8, :cond_5

    move v4, v5

    .line 363
    .end local v5           #j:I
    .restart local v4       #j:I
    :goto_4
    add-int/lit8 v3, v3, 0x1

    move v5, v4

    .end local v4           #j:I
    .restart local v5       #j:I
    goto :goto_3

    .line 366
    :cond_5
    if-eqz p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/jcraft/jsch/HostKey;->isMatched(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_8

    if-eqz p2, :cond_6

    invoke-virtual {v2}, Lcom/jcraft/jsch/HostKey;->getType()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 369
    :cond_6
    add-int/lit8 v4, v5, 0x1

    .end local v5           #j:I
    .restart local v4       #j:I
    aput-object v2, v1, v5

    goto :goto_4

    .line 373
    .end local v1           #foo:[Lcom/jcraft/jsch/HostKey;
    .end local v2           #hk:Lcom/jcraft/jsch/HostKey;
    .end local v4           #j:I
    :catchall_0
    move-exception v6

    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v6

    .line 372
    .restart local v1       #foo:[Lcom/jcraft/jsch/HostKey;
    .restart local v5       #j:I
    :cond_7
    :try_start_1
    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    .restart local v2       #hk:Lcom/jcraft/jsch/HostKey;
    :cond_8
    move v4, v5

    .end local v5           #j:I
    .restart local v4       #j:I
    goto :goto_4
.end method

.method getKnownHostsFile()Ljava/lang/String;
    .locals 1

    .prologue
    .line 243
    iget-object v0, p0, Lcom/jcraft/jsch/KnownHosts;->known_hosts:Ljava/lang/String;

    return-object v0
.end method

.method public getKnownHostsRepositoryID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 244
    iget-object v0, p0, Lcom/jcraft/jsch/KnownHosts;->known_hosts:Ljava/lang/String;

    return-object v0
.end method

.method public remove(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "host"
    .parameter "type"

    .prologue
    .line 376
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/jcraft/jsch/KnownHosts;->remove(Ljava/lang/String;Ljava/lang/String;[B)V

    .line 377
    return-void
.end method

.method public remove(Ljava/lang/String;Ljava/lang/String;[B)V
    .locals 7
    .parameter "host"
    .parameter "type"
    .parameter "key"

    .prologue
    .line 379
    const/4 v4, 0x0

    .line 380
    .local v4, sync:Z
    iget-object v6, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    monitor-enter v6

    .line 381
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    :try_start_0
    iget-object v5, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v5

    if-ge v3, v5, :cond_4

    .line 382
    iget-object v5, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v5, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/jcraft/jsch/HostKey;

    move-object v0, v5

    check-cast v0, Lcom/jcraft/jsch/HostKey;

    move-object v1, v0

    .line 383
    .local v1, hk:Lcom/jcraft/jsch/HostKey;
    if-eqz p1, :cond_0

    invoke-virtual {v1, p1}, Lcom/jcraft/jsch/HostKey;->isMatched(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    if-eqz p2, :cond_0

    invoke-virtual {v1}, Lcom/jcraft/jsch/HostKey;->getType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    if-eqz p3, :cond_0

    iget-object v5, v1, Lcom/jcraft/jsch/HostKey;->key:[B

    invoke-static {p3, v5}, Lcom/jcraft/jsch/Util;->array_equals([B[B)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 387
    :cond_0
    invoke-virtual {v1}, Lcom/jcraft/jsch/HostKey;->getHost()Ljava/lang/String;

    move-result-object v2

    .line 388
    .local v2, hosts:Ljava/lang/String;
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    instance-of v5, v1, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;

    if-eqz v5, :cond_3

    move-object v0, v1

    check-cast v0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;

    move-object v5, v0

    invoke-virtual {v5}, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->isHashed()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 391
    :cond_1
    iget-object v5, p0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v5, v1}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z

    .line 396
    :goto_1
    const/4 v4, 0x1

    .line 381
    .end local v2           #hosts:Ljava/lang/String;
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 394
    .restart local v2       #hosts:Ljava/lang/String;
    :cond_3
    invoke-direct {p0, v2, p1}, Lcom/jcraft/jsch/KnownHosts;->deleteSubString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v1, Lcom/jcraft/jsch/HostKey;->host:Ljava/lang/String;

    goto :goto_1

    .line 399
    .end local v1           #hk:Lcom/jcraft/jsch/HostKey;
    .end local v2           #hosts:Ljava/lang/String;
    :catchall_0
    move-exception v5

    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5

    :cond_4
    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 400
    if-eqz v4, :cond_5

    .line 401
    :try_start_2
    invoke-virtual {p0}, Lcom/jcraft/jsch/KnownHosts;->sync()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 403
    :cond_5
    :goto_2
    return-void

    .line 401
    :catch_0
    move-exception v5

    goto :goto_2
.end method

.method setKnownHosts(Ljava/io/InputStream;)V
    .locals 22
    .parameter "foo"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 66
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->removeAllElements()V

    .line 67
    new-instance v20, Ljava/lang/StringBuffer;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuffer;-><init>()V

    .line 70
    .local v20, sb:Ljava/lang/StringBuffer;
    const/4 v13, 0x0

    .line 72
    .local v13, error:Z
    move-object/from16 v14, p1

    .line 74
    .local v14, fis:Ljava/io/InputStream;
    const/16 v18, 0x0

    .line 76
    .local v18, key:Ljava/lang/String;
    const/16 v3, 0x400

    :try_start_0
    new-array v9, v3, [B

    .line 77
    .local v9, buf:[B
    const/4 v10, 0x0

    .line 80
    .local v10, bufl:I
    :goto_0
    const/4 v10, 0x0

    move v11, v10

    .line 82
    .end local v10           #bufl:I
    .local v11, bufl:I
    :cond_0
    :goto_1
    invoke-virtual {v14}, Ljava/io/InputStream;->read()I

    move-result v16

    .line 83
    .local v16, j:I
    const/4 v3, -0x1

    move/from16 v0, v16

    if-ne v0, v3, :cond_1

    .line 84
    if-nez v11, :cond_2

    .line 226
    invoke-virtual {v14}, Ljava/io/InputStream;->close()V

    .line 227
    if-eqz v13, :cond_27

    .line 228
    new-instance v3, Lcom/jcraft/jsch/JSchException;

    const-string v7, "KnownHosts: invalid format"

    invoke-direct {v3, v7}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 231
    .end local v9           #buf:[B
    .end local v11           #bufl:I
    .end local v16           #j:I
    :catch_0
    move-exception v12

    .line 232
    .local v12, e:Ljava/lang/Exception;
    instance-of v3, v12, Lcom/jcraft/jsch/JSchException;

    if-eqz v3, :cond_25

    .line 233
    check-cast v12, Lcom/jcraft/jsch/JSchException;

    .end local v12           #e:Ljava/lang/Exception;
    throw v12

    .line 87
    .restart local v9       #buf:[B
    .restart local v11       #bufl:I
    .restart local v16       #j:I
    :cond_1
    const/16 v3, 0xd

    move/from16 v0, v16

    if-eq v0, v3, :cond_0

    .line 88
    const/16 v3, 0xa

    move/from16 v0, v16

    if-ne v0, v3, :cond_4

    .line 98
    :cond_2
    const/16 v16, 0x0

    .line 99
    :goto_2
    move/from16 v0, v16

    if-ge v0, v11, :cond_7

    .line 100
    :try_start_1
    aget-byte v15, v9, v16

    .line 101
    .local v15, i:B
    const/16 v3, 0x20

    if-eq v15, v3, :cond_3

    const/16 v3, 0x9

    if-ne v15, v3, :cond_6

    :cond_3
    add-int/lit8 v16, v16, 0x1

    goto :goto_2

    .line 89
    .end local v15           #i:B
    :cond_4
    array-length v3, v9

    if-gt v3, v11, :cond_5

    .line 90
    const/16 v3, 0x2800

    if-gt v11, v3, :cond_2

    .line 91
    array-length v3, v9

    mul-int/lit8 v3, v3, 0x2

    new-array v0, v3, [B

    move-object/from16 v19, v0

    .line 92
    .local v19, newbuf:[B
    const/4 v3, 0x0

    const/4 v7, 0x0

    array-length v0, v9

    move/from16 v21, v0

    move-object/from16 v0, v19

    move/from16 v1, v21

    invoke-static {v9, v3, v0, v7, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 93
    move-object/from16 v9, v19

    .line 95
    .end local v19           #newbuf:[B
    :cond_5
    add-int/lit8 v10, v11, 0x1

    .end local v11           #bufl:I
    .restart local v10       #bufl:I
    move/from16 v0, v16

    int-to-byte v3, v0

    aput-byte v3, v9, v11

    move v11, v10

    .end local v10           #bufl:I
    .restart local v11       #bufl:I
    goto :goto_1

    .line 102
    .restart local v15       #i:B
    :cond_6
    const/16 v3, 0x23

    if-ne v15, v3, :cond_7

    .line 103
    const/4 v3, 0x0

    invoke-static {v9, v3, v11}, Lcom/jcraft/jsch/Util;->byte2str([BII)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/jcraft/jsch/KnownHosts;->addInvalidLine(Ljava/lang/String;)V

    move v10, v11

    .line 104
    .end local v11           #bufl:I
    .restart local v10       #bufl:I
    goto :goto_0

    .line 108
    .end local v10           #bufl:I
    .end local v15           #i:B
    .restart local v11       #bufl:I
    :cond_7
    move/from16 v0, v16

    if-lt v0, v11, :cond_8

    .line 109
    const/4 v3, 0x0

    invoke-static {v9, v3, v11}, Lcom/jcraft/jsch/Util;->byte2str([BII)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/jcraft/jsch/KnownHosts;->addInvalidLine(Ljava/lang/String;)V

    move v10, v11

    .line 110
    .end local v11           #bufl:I
    .restart local v10       #bufl:I
    goto/16 :goto_0

    .line 113
    .end local v10           #bufl:I
    .restart local v11       #bufl:I
    :cond_8
    const/4 v3, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->setLength(I)V

    move/from16 v17, v16

    .line 114
    .end local v16           #j:I
    .local v17, j:I
    :goto_3
    move/from16 v0, v17

    if-ge v0, v11, :cond_2c

    .line 115
    add-int/lit8 v16, v17, 0x1

    .end local v17           #j:I
    .restart local v16       #j:I
    aget-byte v15, v9, v17

    .line 116
    .restart local v15       #i:B
    const/16 v3, 0x20

    if-eq v15, v3, :cond_9

    const/16 v3, 0x9

    if-ne v15, v3, :cond_b

    .line 119
    .end local v15           #i:B
    :cond_9
    :goto_4
    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 120
    .local v5, host:Ljava/lang/String;
    move/from16 v0, v16

    if-ge v0, v11, :cond_a

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_c

    .line 121
    :cond_a
    const/4 v3, 0x0

    invoke-static {v9, v3, v11}, Lcom/jcraft/jsch/Util;->byte2str([BII)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/jcraft/jsch/KnownHosts;->addInvalidLine(Ljava/lang/String;)V

    move v10, v11

    .line 122
    .end local v11           #bufl:I
    .restart local v10       #bufl:I
    goto/16 :goto_0

    .line 117
    .end local v5           #host:Ljava/lang/String;
    .end local v10           #bufl:I
    .restart local v11       #bufl:I
    .restart local v15       #i:B
    :cond_b
    int-to-char v3, v15

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move/from16 v17, v16

    .end local v16           #j:I
    .restart local v17       #j:I
    goto :goto_3

    .line 125
    .end local v15           #i:B
    .end local v17           #j:I
    .restart local v5       #host:Ljava/lang/String;
    .restart local v16       #j:I
    :cond_c
    :goto_5
    move/from16 v0, v16

    if-ge v0, v11, :cond_e

    .line 126
    aget-byte v15, v9, v16

    .line 127
    .restart local v15       #i:B
    const/16 v3, 0x20

    if-eq v15, v3, :cond_d

    const/16 v3, 0x9

    if-ne v15, v3, :cond_e

    :cond_d
    add-int/lit8 v16, v16, 0x1

    goto :goto_5

    .line 131
    .end local v15           #i:B
    :cond_e
    const-string v4, ""

    .line 132
    .local v4, marker:Ljava/lang/String;
    const/4 v3, 0x0

    invoke-virtual {v5, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v7, 0x40

    if-ne v3, v7, :cond_14

    .line 133
    move-object v4, v5

    .line 135
    const/4 v3, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->setLength(I)V

    move/from16 v17, v16

    .line 136
    .end local v16           #j:I
    .restart local v17       #j:I
    :goto_6
    move/from16 v0, v17

    if-ge v0, v11, :cond_2b

    .line 137
    add-int/lit8 v16, v17, 0x1

    .end local v17           #j:I
    .restart local v16       #j:I
    aget-byte v15, v9, v17

    .line 138
    .restart local v15       #i:B
    const/16 v3, 0x20

    if-eq v15, v3, :cond_f

    const/16 v3, 0x9

    if-ne v15, v3, :cond_11

    .line 141
    .end local v15           #i:B
    :cond_f
    :goto_7
    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 142
    move/from16 v0, v16

    if-ge v0, v11, :cond_10

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_12

    .line 143
    :cond_10
    const/4 v3, 0x0

    invoke-static {v9, v3, v11}, Lcom/jcraft/jsch/Util;->byte2str([BII)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/jcraft/jsch/KnownHosts;->addInvalidLine(Ljava/lang/String;)V

    move v10, v11

    .line 144
    .end local v11           #bufl:I
    .restart local v10       #bufl:I
    goto/16 :goto_0

    .line 139
    .end local v10           #bufl:I
    .restart local v11       #bufl:I
    .restart local v15       #i:B
    :cond_11
    int-to-char v3, v15

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move/from16 v17, v16

    .end local v16           #j:I
    .restart local v17       #j:I
    goto :goto_6

    .line 147
    .end local v15           #i:B
    .end local v17           #j:I
    .restart local v16       #j:I
    :cond_12
    :goto_8
    move/from16 v0, v16

    if-ge v0, v11, :cond_14

    .line 148
    aget-byte v15, v9, v16

    .line 149
    .restart local v15       #i:B
    const/16 v3, 0x20

    if-eq v15, v3, :cond_13

    const/16 v3, 0x9

    if-ne v15, v3, :cond_14

    :cond_13
    add-int/lit8 v16, v16, 0x1

    goto :goto_8

    .line 154
    .end local v15           #i:B
    :cond_14
    const/4 v3, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 155
    const/4 v6, -0x1

    .local v6, type:I
    move/from16 v17, v16

    .line 156
    .end local v16           #j:I
    .restart local v17       #j:I
    :goto_9
    move/from16 v0, v17

    if-ge v0, v11, :cond_2a

    .line 157
    add-int/lit8 v16, v17, 0x1

    .end local v17           #j:I
    .restart local v16       #j:I
    aget-byte v15, v9, v17

    .line 158
    .restart local v15       #i:B
    const/16 v3, 0x20

    if-eq v15, v3, :cond_15

    const/16 v3, 0x9

    if-ne v15, v3, :cond_16

    .line 161
    .end local v15           #i:B
    :cond_15
    :goto_a
    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v7, "ssh-dss"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_17

    const/4 v6, 0x1

    .line 164
    :goto_b
    move/from16 v0, v16

    if-lt v0, v11, :cond_19

    .line 165
    const/4 v3, 0x0

    invoke-static {v9, v3, v11}, Lcom/jcraft/jsch/Util;->byte2str([BII)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/jcraft/jsch/KnownHosts;->addInvalidLine(Ljava/lang/String;)V

    move v10, v11

    .line 166
    .end local v11           #bufl:I
    .restart local v10       #bufl:I
    goto/16 :goto_0

    .line 159
    .end local v10           #bufl:I
    .restart local v11       #bufl:I
    .restart local v15       #i:B
    :cond_16
    int-to-char v3, v15

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move/from16 v17, v16

    .end local v16           #j:I
    .restart local v17       #j:I
    goto :goto_9

    .line 162
    .end local v15           #i:B
    .end local v17           #j:I
    .restart local v16       #j:I
    :cond_17
    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v7, "ssh-rsa"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_18

    const/4 v6, 0x2

    goto :goto_b

    .line 163
    :cond_18
    move/from16 v16, v11

    goto :goto_b

    .line 169
    :cond_19
    :goto_c
    move/from16 v0, v16

    if-ge v0, v11, :cond_1b

    .line 170
    aget-byte v15, v9, v16

    .line 171
    .restart local v15       #i:B
    const/16 v3, 0x20

    if-eq v15, v3, :cond_1a

    const/16 v3, 0x9

    if-ne v15, v3, :cond_1b

    :cond_1a
    add-int/lit8 v16, v16, 0x1

    goto :goto_c

    .line 175
    .end local v15           #i:B
    :cond_1b
    const/4 v3, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->setLength(I)V

    move/from16 v17, v16

    .line 176
    .end local v16           #j:I
    .restart local v17       #j:I
    :goto_d
    move/from16 v0, v17

    if-ge v0, v11, :cond_29

    .line 177
    add-int/lit8 v16, v17, 0x1

    .end local v17           #j:I
    .restart local v16       #j:I
    aget-byte v15, v9, v17

    .line 178
    .restart local v15       #i:B
    const/16 v3, 0xd

    if-ne v15, v3, :cond_1c

    move/from16 v17, v16

    .end local v16           #j:I
    .restart local v17       #j:I
    goto :goto_d

    .line 179
    .end local v17           #j:I
    .restart local v16       #j:I
    :cond_1c
    const/16 v3, 0xa

    if-ne v15, v3, :cond_1e

    .line 183
    .end local v15           #i:B
    :cond_1d
    :goto_e
    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    .line 184
    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_1f

    .line 185
    const/4 v3, 0x0

    invoke-static {v9, v3, v11}, Lcom/jcraft/jsch/Util;->byte2str([BII)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/jcraft/jsch/KnownHosts;->addInvalidLine(Ljava/lang/String;)V

    move v10, v11

    .line 186
    .end local v11           #bufl:I
    .restart local v10       #bufl:I
    goto/16 :goto_0

    .line 180
    .end local v10           #bufl:I
    .restart local v11       #bufl:I
    .restart local v15       #i:B
    :cond_1e
    const/16 v3, 0x20

    if-eq v15, v3, :cond_1d

    const/16 v3, 0x9

    if-eq v15, v3, :cond_1d

    .line 181
    int-to-char v3, v15

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move/from16 v17, v16

    .end local v16           #j:I
    .restart local v17       #j:I
    goto :goto_d

    .line 189
    .end local v15           #i:B
    .end local v17           #j:I
    .restart local v16       #j:I
    :cond_1f
    :goto_f
    move/from16 v0, v16

    if-ge v0, v11, :cond_21

    .line 190
    aget-byte v15, v9, v16

    .line 191
    .restart local v15       #i:B
    const/16 v3, 0x20

    if-eq v15, v3, :cond_20

    const/16 v3, 0x9

    if-ne v15, v3, :cond_21

    :cond_20
    add-int/lit8 v16, v16, 0x1

    goto :goto_f

    .line 205
    .end local v15           #i:B
    :cond_21
    const/4 v8, 0x0

    .line 206
    .local v8, comment:Ljava/lang/String;
    move/from16 v0, v16

    if-ge v0, v11, :cond_23

    .line 207
    const/4 v3, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->setLength(I)V

    move/from16 v17, v16

    .line 208
    .end local v16           #j:I
    .restart local v17       #j:I
    :goto_10
    move/from16 v0, v17

    if-ge v0, v11, :cond_28

    .line 209
    add-int/lit8 v16, v17, 0x1

    .end local v17           #j:I
    .restart local v16       #j:I
    aget-byte v15, v9, v17

    .line 210
    .restart local v15       #i:B
    const/16 v3, 0xd

    if-ne v15, v3, :cond_22

    move/from16 v17, v16

    .end local v16           #j:I
    .restart local v17       #j:I
    goto :goto_10

    .line 211
    .end local v17           #j:I
    .restart local v16       #j:I
    :cond_22
    const/16 v3, 0xa

    if-ne v15, v3, :cond_24

    .line 214
    .end local v15           #i:B
    :goto_11
    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    .line 220
    :cond_23
    const/4 v2, 0x0

    .line 221
    .local v2, hk:Lcom/jcraft/jsch/HostKey;
    new-instance v2, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;

    .end local v2           #hk:Lcom/jcraft/jsch/HostKey;
    invoke-static/range {v18 .. v18}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v3

    const/4 v7, 0x0

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->length()I

    move-result v21

    move/from16 v0, v21

    invoke-static {v3, v7, v0}, Lcom/jcraft/jsch/Util;->fromBase64([BII)[B

    move-result-object v7

    move-object/from16 v3, p0

    invoke-direct/range {v2 .. v8}, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;-><init>(Lcom/jcraft/jsch/KnownHosts;Ljava/lang/String;Ljava/lang/String;I[BLjava/lang/String;)V

    .line 224
    .restart local v2       #hk:Lcom/jcraft/jsch/HostKey;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/KnownHosts;->pool:Ljava/util/Vector;

    invoke-virtual {v3, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    move v10, v11

    .line 225
    .end local v11           #bufl:I
    .restart local v10       #bufl:I
    goto/16 :goto_0

    .line 212
    .end local v2           #hk:Lcom/jcraft/jsch/HostKey;
    .end local v10           #bufl:I
    .restart local v11       #bufl:I
    .restart local v15       #i:B
    :cond_24
    int-to-char v3, v15

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move/from16 v17, v16

    .end local v16           #j:I
    .restart local v17       #j:I
    goto :goto_10

    .line 234
    .end local v4           #marker:Ljava/lang/String;
    .end local v5           #host:Ljava/lang/String;
    .end local v6           #type:I
    .end local v8           #comment:Ljava/lang/String;
    .end local v9           #buf:[B
    .end local v11           #bufl:I
    .end local v15           #i:B
    .end local v17           #j:I
    .restart local v12       #e:Ljava/lang/Exception;
    :cond_25
    instance-of v3, v12, Ljava/lang/Throwable;

    if-eqz v3, :cond_26

    .line 235
    new-instance v3, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v12}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v7, v12}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 236
    :cond_26
    new-instance v3, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v12}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v7}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 238
    .end local v12           #e:Ljava/lang/Exception;
    .restart local v9       #buf:[B
    .restart local v11       #bufl:I
    .restart local v16       #j:I
    :cond_27
    return-void

    .end local v16           #j:I
    .restart local v4       #marker:Ljava/lang/String;
    .restart local v5       #host:Ljava/lang/String;
    .restart local v6       #type:I
    .restart local v8       #comment:Ljava/lang/String;
    .restart local v17       #j:I
    :cond_28
    move/from16 v16, v17

    .end local v17           #j:I
    .restart local v16       #j:I
    goto :goto_11

    .end local v8           #comment:Ljava/lang/String;
    .end local v16           #j:I
    .restart local v17       #j:I
    :cond_29
    move/from16 v16, v17

    .end local v17           #j:I
    .restart local v16       #j:I
    goto/16 :goto_e

    .end local v16           #j:I
    .restart local v17       #j:I
    :cond_2a
    move/from16 v16, v17

    .end local v17           #j:I
    .restart local v16       #j:I
    goto/16 :goto_a

    .end local v6           #type:I
    .end local v16           #j:I
    .restart local v17       #j:I
    :cond_2b
    move/from16 v16, v17

    .end local v17           #j:I
    .restart local v16       #j:I
    goto/16 :goto_7

    .end local v4           #marker:Ljava/lang/String;
    .end local v5           #host:Ljava/lang/String;
    .end local v16           #j:I
    .restart local v17       #j:I
    :cond_2c
    move/from16 v16, v17

    .end local v17           #j:I
    .restart local v16       #j:I
    goto/16 :goto_4
.end method

.method setKnownHosts(Ljava/lang/String;)V
    .locals 2
    .parameter "foo"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 58
    :try_start_0
    iput-object p1, p0, Lcom/jcraft/jsch/KnownHosts;->known_hosts:Ljava/lang/String;

    .line 59
    new-instance v0, Ljava/io/FileInputStream;

    invoke-static {p1}, Lcom/jcraft/jsch/Util;->checkTilde(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 60
    .local v0, fis:Ljava/io/FileInputStream;
    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/KnownHosts;->setKnownHosts(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    .end local v0           #fis:Ljava/io/FileInputStream;
    :goto_0
    return-void

    .line 62
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method protected sync()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 406
    iget-object v0, p0, Lcom/jcraft/jsch/KnownHosts;->known_hosts:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 407
    iget-object v0, p0, Lcom/jcraft/jsch/KnownHosts;->known_hosts:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/KnownHosts;->sync(Ljava/lang/String;)V

    .line 408
    :cond_0
    return-void
.end method

.method protected declared-synchronized sync(Ljava/lang/String;)V
    .locals 2
    .parameter "foo"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 410
    monitor-enter p0

    if-nez p1, :cond_0

    .line 414
    :goto_0
    monitor-exit p0

    return-void

    .line 411
    :cond_0
    :try_start_0
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-static {p1}, Lcom/jcraft/jsch/Util;->checkTilde(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 412
    .local v0, fos:Ljava/io/FileOutputStream;
    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/KnownHosts;->dump(Ljava/io/OutputStream;)V

    .line 413
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 410
    .end local v0           #fos:Ljava/io/FileOutputStream;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method
