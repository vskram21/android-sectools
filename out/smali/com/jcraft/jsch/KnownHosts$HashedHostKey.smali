.class Lcom/jcraft/jsch/KnownHosts$HashedHostKey;
.super Lcom/jcraft/jsch/HostKey;
.source "KnownHosts.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jcraft/jsch/KnownHosts;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "HashedHostKey"
.end annotation


# static fields
.field private static final HASH_DELIM:Ljava/lang/String; = "|"

.field private static final HASH_MAGIC:Ljava/lang/String; = "|1|"


# instance fields
.field hash:[B

.field private hashed:Z

.field salt:[B

.field final synthetic this$0:Lcom/jcraft/jsch/KnownHosts;


# direct methods
.method constructor <init>(Lcom/jcraft/jsch/KnownHosts;Ljava/lang/String;I[B)V
    .locals 7
    .parameter
    .parameter "host"
    .parameter "type"
    .parameter "key"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 511
    const-string v2, ""

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v6}, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;-><init>(Lcom/jcraft/jsch/KnownHosts;Ljava/lang/String;Ljava/lang/String;I[BLjava/lang/String;)V

    .line 512
    return-void
.end method

.method constructor <init>(Lcom/jcraft/jsch/KnownHosts;Ljava/lang/String;Ljava/lang/String;I[BLjava/lang/String;)V
    .locals 9
    .parameter
    .parameter "marker"
    .parameter "host"
    .parameter "type"
    .parameter "key"
    .parameter "comment"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 513
    iput-object p1, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->this$0:Lcom/jcraft/jsch/KnownHosts;

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move v3, p4

    move-object v4, p5

    move-object v5, p6

    .line 514
    invoke-direct/range {v0 .. v5}, Lcom/jcraft/jsch/HostKey;-><init>(Ljava/lang/String;Ljava/lang/String;I[BLjava/lang/String;)V

    .line 502
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hashed:Z

    .line 503
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->salt:[B

    .line 504
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hash:[B

    .line 515
    iget-object v0, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->host:Ljava/lang/String;

    const-string v1, "|1|"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->host:Ljava/lang/String;

    const-string v1, "|1|"

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_1

    .line 517
    iget-object v0, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->host:Ljava/lang/String;

    const-string v1, "|1|"

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 518
    .local v8, data:Ljava/lang/String;
    const/4 v0, 0x0

    const-string v1, "|"

    invoke-virtual {v8, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v8, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 519
    .local v7, _salt:Ljava/lang/String;
    const-string v0, "|"

    invoke-virtual {v8, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v8, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 520
    .local v6, _hash:Ljava/lang/String;
    invoke-static {v7}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/jcraft/jsch/Util;->fromBase64([BII)[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->salt:[B

    .line 521
    invoke-static {v6}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/jcraft/jsch/Util;->fromBase64([BII)[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hash:[B

    .line 522
    iget-object v0, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->salt:[B

    array-length v0, v0

    const/16 v1, 0x14

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hash:[B

    array-length v0, v0

    const/16 v1, 0x14

    if-eq v0, v1, :cond_2

    .line 524
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->salt:[B

    .line 525
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hash:[B

    .line 530
    .end local v6           #_hash:Ljava/lang/String;
    .end local v7           #_salt:Ljava/lang/String;
    .end local v8           #data:Ljava/lang/String;
    :cond_1
    :goto_0
    return-void

    .line 528
    .restart local v6       #_hash:Ljava/lang/String;
    .restart local v7       #_salt:Ljava/lang/String;
    .restart local v8       #data:Ljava/lang/String;
    :cond_2
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hashed:Z

    goto :goto_0
.end method

.method constructor <init>(Lcom/jcraft/jsch/KnownHosts;Ljava/lang/String;[B)V
    .locals 1
    .parameter
    .parameter "host"
    .parameter "key"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 508
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p3}, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;-><init>(Lcom/jcraft/jsch/KnownHosts;Ljava/lang/String;I[B)V

    .line 509
    return-void
.end method


# virtual methods
.method hash()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 558
    iget-boolean v3, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hashed:Z

    if-eqz v3, :cond_0

    .line 582
    :goto_0
    return-void

    .line 560
    :cond_0
    iget-object v3, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->this$0:Lcom/jcraft/jsch/KnownHosts;

    #calls: Lcom/jcraft/jsch/KnownHosts;->getHMACSHA1()Lcom/jcraft/jsch/MAC;
    invoke-static {v3}, Lcom/jcraft/jsch/KnownHosts;->access$000(Lcom/jcraft/jsch/KnownHosts;)Lcom/jcraft/jsch/MAC;

    move-result-object v1

    .line 561
    .local v1, macsha1:Lcom/jcraft/jsch/MAC;
    iget-object v3, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->salt:[B

    if-nez v3, :cond_1

    .line 562
    sget-object v2, Lcom/jcraft/jsch/Session;->random:Lcom/jcraft/jsch/Random;

    .line 563
    .local v2, random:Lcom/jcraft/jsch/Random;
    monitor-enter v2

    .line 564
    :try_start_0
    invoke-interface {v1}, Lcom/jcraft/jsch/MAC;->getBlockSize()I

    move-result v3

    new-array v3, v3, [B

    iput-object v3, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->salt:[B

    .line 565
    iget-object v3, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->salt:[B

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->salt:[B

    array-length v5, v5

    invoke-interface {v2, v3, v4, v5}, Lcom/jcraft/jsch/Random;->fill([BII)V

    .line 566
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 569
    .end local v2           #random:Lcom/jcraft/jsch/Random;
    :cond_1
    :try_start_1
    monitor-enter v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 570
    :try_start_2
    iget-object v3, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->salt:[B

    invoke-interface {v1, v3}, Lcom/jcraft/jsch/MAC;->init([B)V

    .line 571
    iget-object v3, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->host:Ljava/lang/String;

    invoke-static {v3}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    .line 572
    .local v0, foo:[B
    const/4 v3, 0x0

    array-length v4, v0

    invoke-interface {v1, v0, v3, v4}, Lcom/jcraft/jsch/MAC;->update([BII)V

    .line 573
    invoke-interface {v1}, Lcom/jcraft/jsch/MAC;->getBlockSize()I

    move-result v3

    new-array v3, v3, [B

    iput-object v3, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hash:[B

    .line 574
    iget-object v3, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hash:[B

    const/4 v4, 0x0

    invoke-interface {v1, v3, v4}, Lcom/jcraft/jsch/MAC;->doFinal([BI)V

    .line 575
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 579
    .end local v0           #foo:[B
    :goto_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "|1|"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->salt:[B

    iget-object v5, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->salt:[B

    array-length v5, v5

    invoke-static {v4, v6, v5}, Lcom/jcraft/jsch/Util;->toBase64([BII)[B

    move-result-object v4

    invoke-static {v4}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "|"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hash:[B

    iget-object v5, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hash:[B

    array-length v5, v5

    invoke-static {v4, v6, v5}, Lcom/jcraft/jsch/Util;->toBase64([BII)[B

    move-result-object v4

    invoke-static {v4}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->host:Ljava/lang/String;

    .line 581
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hashed:Z

    goto :goto_0

    .line 566
    .restart local v2       #random:Lcom/jcraft/jsch/Random;
    :catchall_0
    move-exception v3

    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v3

    .line 575
    .end local v2           #random:Lcom/jcraft/jsch/Random;
    :catchall_1
    move-exception v3

    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :try_start_5
    throw v3
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 577
    :catch_0
    move-exception v3

    goto :goto_1
.end method

.method isHashed()Z
    .locals 1

    .prologue
    .line 554
    iget-boolean v0, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hashed:Z

    return v0
.end method

.method isMatched(Ljava/lang/String;)Z
    .locals 7
    .parameter "_host"

    .prologue
    const/4 v5, 0x0

    .line 533
    iget-boolean v4, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hashed:Z

    if-nez v4, :cond_0

    .line 534
    invoke-super {p0, p1}, Lcom/jcraft/jsch/HostKey;->isMatched(Ljava/lang/String;)Z

    move-result v4

    .line 550
    :goto_0
    return v4

    .line 536
    :cond_0
    iget-object v4, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->this$0:Lcom/jcraft/jsch/KnownHosts;

    #calls: Lcom/jcraft/jsch/KnownHosts;->getHMACSHA1()Lcom/jcraft/jsch/MAC;
    invoke-static {v4}, Lcom/jcraft/jsch/KnownHosts;->access$000(Lcom/jcraft/jsch/KnownHosts;)Lcom/jcraft/jsch/MAC;

    move-result-object v3

    .line 538
    .local v3, macsha1:Lcom/jcraft/jsch/MAC;
    :try_start_0
    monitor-enter v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 539
    :try_start_1
    iget-object v4, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->salt:[B

    invoke-interface {v3, v4}, Lcom/jcraft/jsch/MAC;->init([B)V

    .line 540
    invoke-static {p1}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v2

    .line 541
    .local v2, foo:[B
    const/4 v4, 0x0

    array-length v6, v2

    invoke-interface {v3, v2, v4, v6}, Lcom/jcraft/jsch/MAC;->update([BII)V

    .line 542
    invoke-interface {v3}, Lcom/jcraft/jsch/MAC;->getBlockSize()I

    move-result v4

    new-array v0, v4, [B

    .line 543
    .local v0, bar:[B
    const/4 v4, 0x0

    invoke-interface {v3, v0, v4}, Lcom/jcraft/jsch/MAC;->doFinal([BI)V

    .line 544
    iget-object v4, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hash:[B

    invoke-static {v4, v0}, Lcom/jcraft/jsch/Util;->array_equals([B[B)Z

    move-result v4

    monitor-exit v3

    goto :goto_0

    .line 545
    .end local v0           #bar:[B
    .end local v2           #foo:[B
    :catchall_0
    move-exception v4

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v4
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 547
    :catch_0
    move-exception v1

    .line 548
    .local v1, e:Ljava/lang/Exception;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v4, v1}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    move v4, v5

    .line 550
    goto :goto_0
.end method
