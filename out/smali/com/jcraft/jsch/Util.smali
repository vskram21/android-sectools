.class Lcom/jcraft/jsch/Util;
.super Ljava/lang/Object;
.source "Util.java"


# static fields
.field private static final b64:[B

.field private static chars:[Ljava/lang/String;

.field static final empty:[B


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 38
    const-string v0, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/="

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/jcraft/jsch/Util;->b64:[B

    .line 304
    const/16 v0, 0x10

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "0"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "1"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "2"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "3"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "4"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "5"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "6"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "7"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "8"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "9"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "a"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "b"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "c"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "d"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "e"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "f"

    aput-object v2, v0, v1

    sput-object v0, Lcom/jcraft/jsch/Util;->chars:[Ljava/lang/String;

    .line 426
    const-string v0, ""

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/jcraft/jsch/Util;->empty:[B

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static array_equals([B[B)Z
    .locals 5
    .parameter "foo"
    .parameter "bar"

    .prologue
    const/4 v2, 0x0

    .line 328
    array-length v0, p0

    .line 329
    .local v0, i:I
    array-length v3, p1

    if-eq v0, v3, :cond_1

    .line 332
    :cond_0
    :goto_0
    return v2

    .line 330
    :cond_1
    const/4 v1, 0x0

    .local v1, j:I
    :goto_1
    if-ge v1, v0, :cond_2

    aget-byte v3, p0, v1

    aget-byte v4, p1, v1

    if-ne v3, v4, :cond_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 332
    :cond_2
    const/4 v2, 0x1

    goto :goto_0
.end method

.method static byte2str([B)Ljava/lang/String;
    .locals 3
    .parameter "str"

    .prologue
    .line 419
    const/4 v0, 0x0

    array-length v1, p0

    const-string v2, "UTF-8"

    invoke-static {p0, v0, v1, v2}, Lcom/jcraft/jsch/Util;->byte2str([BIILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static byte2str([BII)Ljava/lang/String;
    .locals 1
    .parameter "str"
    .parameter "s"
    .parameter "l"

    .prologue
    .line 423
    const-string v0, "UTF-8"

    invoke-static {p0, p1, p2, v0}, Lcom/jcraft/jsch/Util;->byte2str([BIILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static byte2str([BIILjava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "str"
    .parameter "s"
    .parameter "l"
    .parameter "encoding"

    .prologue
    .line 412
    :try_start_0
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p0, p1, p2, p3}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 414
    :goto_0
    return-object v1

    .line 413
    :catch_0
    move-exception v0

    .line 414
    .local v0, e:Ljava/io/UnsupportedEncodingException;
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p0, p1, p2}, Ljava/lang/String;-><init>([BII)V

    goto :goto_0
.end method

.method static byte2str([BLjava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "str"
    .parameter "encoding"

    .prologue
    .line 408
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1, p1}, Lcom/jcraft/jsch/Util;->byte2str([BIILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static bzero([B)V
    .locals 2
    .parameter "foo"

    .prologue
    .line 449
    if-nez p0, :cond_1

    .line 453
    :cond_0
    return-void

    .line 451
    :cond_1
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_0

    .line 452
    const/4 v1, 0x0

    aput-byte v1, p0, v0

    .line 451
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method static checkTilde(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "str"

    .prologue
    .line 472
    const-string v0, "~"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 474
    :try_start_0
    const-string v0, "~"

    const-string v1, "user.home"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p0

    .line 479
    :cond_0
    :goto_0
    return-object p0

    .line 476
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method static createSocket(Ljava/lang/String;II)Ljava/net/Socket;
    .locals 12
    .parameter "host"
    .parameter "port"
    .parameter "timeout"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    const/4 v11, 0x0

    .line 335
    const/4 v5, 0x0

    .line 336
    .local v5, socket:Ljava/net/Socket;
    if-nez p2, :cond_1

    .line 338
    :try_start_0
    new-instance v5, Ljava/net/Socket;

    .end local v5           #socket:Ljava/net/Socket;
    invoke-direct {v5, p0, p1}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .restart local v5       #socket:Ljava/net/Socket;
    move-object v6, v5

    .line 391
    .end local v5           #socket:Ljava/net/Socket;
    .local v6, socket:Ljava/lang/Object;
    :goto_0
    return-object v6

    .line 341
    .end local v6           #socket:Ljava/lang/Object;
    :catch_0
    move-exception v2

    .line 342
    .local v2, e:Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    .line 343
    .local v4, message:Ljava/lang/String;
    instance-of v9, v2, Ljava/lang/Throwable;

    if-eqz v9, :cond_0

    .line 344
    new-instance v9, Lcom/jcraft/jsch/JSchException;

    invoke-direct {v9, v4, v2}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9

    .line 345
    :cond_0
    new-instance v9, Lcom/jcraft/jsch/JSchException;

    invoke-direct {v9, v4}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 348
    .end local v2           #e:Ljava/lang/Exception;
    .end local v4           #message:Ljava/lang/String;
    .restart local v5       #socket:Ljava/net/Socket;
    :cond_1
    move-object v0, p0

    .line 349
    .local v0, _host:Ljava/lang/String;
    move v1, p1

    .line 350
    .local v1, _port:I
    new-array v7, v9, [Ljava/net/Socket;

    .line 351
    .local v7, sockp:[Ljava/net/Socket;
    new-array v3, v9, [Ljava/lang/Exception;

    .line 352
    .local v3, ee:[Ljava/lang/Exception;
    const-string v4, ""

    .line 353
    .restart local v4       #message:Ljava/lang/String;
    new-instance v8, Ljava/lang/Thread;

    new-instance v9, Lcom/jcraft/jsch/Util$1;

    invoke-direct {v9, v7, v0, v1, v3}, Lcom/jcraft/jsch/Util$1;-><init>([Ljava/net/Socket;Ljava/lang/String;I[Ljava/lang/Exception;)V

    invoke-direct {v8, v9}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 371
    .local v8, tmp:Ljava/lang/Thread;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Opening Socket "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 372
    invoke-virtual {v8}, Ljava/lang/Thread;->start()V

    .line 374
    int-to-long v9, p2

    :try_start_1
    invoke-virtual {v8, v9, v10}, Ljava/lang/Thread;->join(J)V

    .line 375
    const-string v4, "timeout: "
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    .line 379
    :goto_1
    aget-object v9, v7, v11

    if-eqz v9, :cond_2

    aget-object v9, v7, v11

    invoke-virtual {v9}, Ljava/net/Socket;->isConnected()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 380
    aget-object v5, v7, v11

    move-object v6, v5

    .line 391
    .restart local v6       #socket:Ljava/lang/Object;
    goto :goto_0

    .line 383
    .end local v6           #socket:Ljava/lang/Object;
    :cond_2
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "socket is not established"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 384
    aget-object v9, v3, v11

    if-eqz v9, :cond_3

    .line 385
    aget-object v9, v3, v11

    invoke-virtual {v9}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    .line 387
    :cond_3
    invoke-virtual {v8}, Ljava/lang/Thread;->interrupt()V

    .line 388
    const/4 v8, 0x0

    .line 389
    new-instance v9, Lcom/jcraft/jsch/JSchException;

    invoke-direct {v9, v4}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 377
    :catch_1
    move-exception v9

    goto :goto_1
.end method

.method static diffString(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .parameter "str"
    .parameter "not_available"

    .prologue
    .line 456
    const-string v4, ","

    invoke-static {p0, v4}, Lcom/jcraft/jsch/Util;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 457
    .local v3, stra:[Ljava/lang/String;
    const/4 v2, 0x0

    .line 459
    .local v2, result:Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v4, v3

    if-ge v0, v4, :cond_3

    .line 460
    const/4 v1, 0x0

    .local v1, j:I
    :goto_1
    array-length v4, p1

    if-ge v1, v4, :cond_1

    .line 461
    aget-object v4, v3, v0

    aget-object v5, p1, v1

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 459
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 460
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 465
    :cond_1
    if-nez v2, :cond_2

    aget-object v2, v3, v0

    goto :goto_2

    .line 466
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v5, v3, v0

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_2

    .line 468
    .end local v1           #j:I
    :cond_3
    return-object v2
.end method

.method static fromBase64([BII)[B
    .locals 9
    .parameter "buf"
    .parameter "start"
    .parameter "length"

    .prologue
    const/16 v8, 0x3d

    const/4 v7, 0x0

    .line 47
    new-array v1, p2, [B

    .line 48
    .local v1, foo:[B
    const/4 v3, 0x0

    .line 49
    .local v3, j:I
    move v2, p1

    .local v2, i:I
    :goto_0
    add-int v4, p1, p2

    if-ge v2, v4, :cond_0

    .line 50
    aget-byte v4, p0, v2

    invoke-static {v4}, Lcom/jcraft/jsch/Util;->val(B)B

    move-result v4

    shl-int/lit8 v4, v4, 0x2

    add-int/lit8 v5, v2, 0x1

    aget-byte v5, p0, v5

    invoke-static {v5}, Lcom/jcraft/jsch/Util;->val(B)B

    move-result v5

    and-int/lit8 v5, v5, 0x30

    ushr-int/lit8 v5, v5, 0x4

    or-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v1, v3

    .line 51
    add-int/lit8 v4, v2, 0x2

    aget-byte v4, p0, v4

    if-ne v4, v8, :cond_1

    add-int/lit8 v3, v3, 0x1

    .line 57
    :cond_0
    :goto_1
    new-array v0, v3, [B

    .line 58
    .local v0, bar:[B
    invoke-static {v1, v7, v0, v7, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 59
    return-object v0

    .line 52
    .end local v0           #bar:[B
    :cond_1
    add-int/lit8 v4, v3, 0x1

    add-int/lit8 v5, v2, 0x1

    aget-byte v5, p0, v5

    invoke-static {v5}, Lcom/jcraft/jsch/Util;->val(B)B

    move-result v5

    and-int/lit8 v5, v5, 0xf

    shl-int/lit8 v5, v5, 0x4

    add-int/lit8 v6, v2, 0x2

    aget-byte v6, p0, v6

    invoke-static {v6}, Lcom/jcraft/jsch/Util;->val(B)B

    move-result v6

    and-int/lit8 v6, v6, 0x3c

    ushr-int/lit8 v6, v6, 0x2

    or-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, v1, v4

    .line 53
    add-int/lit8 v4, v2, 0x3

    aget-byte v4, p0, v4

    if-ne v4, v8, :cond_2

    add-int/lit8 v3, v3, 0x2

    goto :goto_1

    .line 54
    :cond_2
    add-int/lit8 v4, v3, 0x2

    add-int/lit8 v5, v2, 0x2

    aget-byte v5, p0, v5

    invoke-static {v5}, Lcom/jcraft/jsch/Util;->val(B)B

    move-result v5

    and-int/lit8 v5, v5, 0x3

    shl-int/lit8 v5, v5, 0x6

    add-int/lit8 v6, v2, 0x3

    aget-byte v6, p0, v6

    invoke-static {v6}, Lcom/jcraft/jsch/Util;->val(B)B

    move-result v6

    and-int/lit8 v6, v6, 0x3f

    or-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, v1, v4

    .line 55
    add-int/lit8 v3, v3, 0x3

    .line 49
    add-int/lit8 v2, v2, 0x4

    goto :goto_0
.end method

.method static fromFile(Ljava/lang/String;)[B
    .locals 7
    .parameter "_file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 490
    invoke-static {p0}, Lcom/jcraft/jsch/Util;->checkTilde(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 491
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 492
    .local v0, file:Ljava/io/File;
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 494
    .local v1, fis:Ljava/io/FileInputStream;
    :try_start_0
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v5

    long-to-int v5, v5

    new-array v4, v5, [B

    .line 495
    .local v4, result:[B
    const/4 v3, 0x0

    .line 497
    .local v3, len:I
    :goto_0
    array-length v5, v4

    sub-int/2addr v5, v3

    invoke-virtual {v1, v4, v3, v5}, Ljava/io/FileInputStream;->read([BII)I

    move-result v2

    .line 498
    .local v2, i:I
    if-gtz v2, :cond_1

    .line 502
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 506
    if-eqz v1, :cond_0

    .line 507
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    :cond_0
    return-object v4

    .line 500
    :cond_1
    add-int/2addr v3, v2

    .line 501
    goto :goto_0

    .line 506
    .end local v2           #i:I
    .end local v3           #len:I
    .end local v4           #result:[B
    :catchall_0
    move-exception v5

    if-eqz v1, :cond_2

    .line 507
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    :cond_2
    throw v5
.end method

.method static getFingerPrint(Lcom/jcraft/jsch/HASH;[B)Ljava/lang/String;
    .locals 7
    .parameter "hash"
    .parameter "data"

    .prologue
    .line 309
    :try_start_0
    invoke-interface {p0}, Lcom/jcraft/jsch/HASH;->init()V

    .line 310
    const/4 v5, 0x0

    array-length v6, p1

    invoke-interface {p0, p1, v5, v6}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 311
    invoke-interface {p0}, Lcom/jcraft/jsch/HASH;->digest()[B

    move-result-object v2

    .line 312
    .local v2, foo:[B
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 314
    .local v4, sb:Ljava/lang/StringBuffer;
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    array-length v5, v2

    if-ge v3, v5, :cond_1

    .line 315
    aget-byte v5, v2, v3

    and-int/lit16 v0, v5, 0xff

    .line 316
    .local v0, bar:I
    sget-object v5, Lcom/jcraft/jsch/Util;->chars:[Ljava/lang/String;

    ushr-int/lit8 v6, v0, 0x4

    and-int/lit8 v6, v6, 0xf

    aget-object v5, v5, v6

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 317
    sget-object v5, Lcom/jcraft/jsch/Util;->chars:[Ljava/lang/String;

    and-int/lit8 v6, v0, 0xf

    aget-object v5, v5, v6

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 318
    add-int/lit8 v5, v3, 0x1

    array-length v6, v2

    if-ge v5, v6, :cond_0

    .line 319
    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 314
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 321
    .end local v0           #bar:I
    :cond_1
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 324
    .end local v2           #foo:[B
    .end local v3           #i:I
    .end local v4           #sb:Ljava/lang/StringBuffer;
    :goto_1
    return-object v5

    .line 323
    :catch_0
    move-exception v1

    .line 324
    .local v1, e:Ljava/lang/Exception;
    const-string v5, "???"

    goto :goto_1
.end method

.method private static glob([BI[BI)Z
    .locals 9
    .parameter "pattern"
    .parameter "pattern_index"
    .parameter "name"
    .parameter "name_index"

    .prologue
    .line 145
    array-length v6, p0

    .line 146
    .local v6, patternlen:I
    if-nez v6, :cond_0

    .line 147
    const/4 v5, 0x0

    .line 252
    :goto_0
    return v5

    .line 149
    :cond_0
    array-length v4, p2

    .line 150
    .local v4, namelen:I
    move v1, p1

    .line 151
    .local v1, i:I
    move v3, p3

    .line 153
    .local v3, j:I
    :cond_1
    :goto_1
    if-ge v1, v6, :cond_14

    if-ge v3, v4, :cond_14

    .line 154
    aget-byte v7, p0, v1

    const/16 v8, 0x5c

    if-ne v7, v8, :cond_4

    .line 155
    add-int/lit8 v7, v1, 0x1

    if-ne v7, v6, :cond_2

    .line 156
    const/4 v5, 0x0

    goto :goto_0

    .line 157
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 158
    aget-byte v7, p0, v1

    aget-byte v8, p2, v3

    if-eq v7, v8, :cond_3

    .line 159
    const/4 v5, 0x0

    goto :goto_0

    .line 160
    :cond_3
    aget-byte v7, p0, v1

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->skipUTF8Char(B)I

    move-result v7

    add-int/2addr v1, v7

    .line 161
    aget-byte v7, p2, v3

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->skipUTF8Char(B)I

    move-result v7

    add-int/2addr v3, v7

    .line 162
    goto :goto_1

    .line 165
    :cond_4
    aget-byte v7, p0, v1

    const/16 v8, 0x2a

    if-ne v7, v8, :cond_10

    .line 166
    :goto_2
    if-ge v1, v6, :cond_5

    .line 167
    aget-byte v7, p0, v1

    const/16 v8, 0x2a

    if-ne v7, v8, :cond_5

    .line 168
    add-int/lit8 v1, v1, 0x1

    .line 169
    goto :goto_2

    .line 173
    :cond_5
    if-ne v6, v1, :cond_6

    .line 174
    const/4 v5, 0x1

    goto :goto_0

    .line 176
    :cond_6
    aget-byte v0, p0, v1

    .line 177
    .local v0, foo:B
    const/16 v7, 0x3f

    if-ne v0, v7, :cond_9

    .line 178
    :goto_3
    if-ge v3, v4, :cond_8

    .line 179
    invoke-static {p0, v1, p2, v3}, Lcom/jcraft/jsch/Util;->glob([BI[BI)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 180
    const/4 v5, 0x1

    goto :goto_0

    .line 182
    :cond_7
    aget-byte v7, p2, v3

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->skipUTF8Char(B)I

    move-result v7

    add-int/2addr v3, v7

    goto :goto_3

    .line 184
    :cond_8
    const/4 v5, 0x0

    goto :goto_0

    .line 186
    :cond_9
    const/16 v7, 0x5c

    if-ne v0, v7, :cond_e

    .line 187
    add-int/lit8 v7, v1, 0x1

    if-ne v7, v6, :cond_a

    .line 188
    const/4 v5, 0x0

    goto :goto_0

    .line 189
    :cond_a
    add-int/lit8 v1, v1, 0x1

    .line 190
    aget-byte v0, p0, v1

    .line 191
    :goto_4
    if-ge v3, v4, :cond_c

    .line 192
    aget-byte v7, p2, v3

    if-ne v0, v7, :cond_b

    .line 193
    invoke-static {v0}, Lcom/jcraft/jsch/Util;->skipUTF8Char(B)I

    move-result v7

    add-int/2addr v7, v1

    aget-byte v8, p2, v3

    invoke-static {v8}, Lcom/jcraft/jsch/Util;->skipUTF8Char(B)I

    move-result v8

    add-int/2addr v8, v3

    invoke-static {p0, v7, p2, v8}, Lcom/jcraft/jsch/Util;->glob([BI[BI)Z

    move-result v7

    if-eqz v7, :cond_b

    .line 195
    const/4 v5, 0x1

    goto/16 :goto_0

    .line 198
    :cond_b
    aget-byte v7, p2, v3

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->skipUTF8Char(B)I

    move-result v7

    add-int/2addr v3, v7

    goto :goto_4

    .line 200
    :cond_c
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 209
    :cond_d
    aget-byte v7, p2, v3

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->skipUTF8Char(B)I

    move-result v7

    add-int/2addr v3, v7

    .line 203
    :cond_e
    if-ge v3, v4, :cond_f

    .line 204
    aget-byte v7, p2, v3

    if-ne v0, v7, :cond_d

    .line 205
    invoke-static {p0, v1, p2, v3}, Lcom/jcraft/jsch/Util;->glob([BI[BI)Z

    move-result v7

    if-eqz v7, :cond_d

    .line 206
    const/4 v5, 0x1

    goto/16 :goto_0

    .line 211
    :cond_f
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 214
    .end local v0           #foo:B
    :cond_10
    aget-byte v7, p0, v1

    const/16 v8, 0x3f

    if-ne v7, v8, :cond_11

    .line 215
    add-int/lit8 v1, v1, 0x1

    .line 216
    aget-byte v7, p2, v3

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->skipUTF8Char(B)I

    move-result v7

    add-int/2addr v3, v7

    .line 217
    goto/16 :goto_1

    .line 220
    :cond_11
    aget-byte v7, p0, v1

    aget-byte v8, p2, v3

    if-eq v7, v8, :cond_12

    .line 221
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 223
    :cond_12
    aget-byte v7, p0, v1

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->skipUTF8Char(B)I

    move-result v7

    add-int/2addr v1, v7

    .line 224
    aget-byte v7, p2, v3

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->skipUTF8Char(B)I

    move-result v7

    add-int/2addr v3, v7

    .line 226
    if-lt v3, v4, :cond_1

    .line 227
    if-lt v1, v6, :cond_13

    .line 228
    const/4 v5, 0x1

    goto/16 :goto_0

    .line 230
    :cond_13
    aget-byte v7, p0, v1

    const/16 v8, 0x2a

    if-ne v7, v8, :cond_1

    .line 237
    :cond_14
    if-ne v1, v6, :cond_15

    if-ne v3, v4, :cond_15

    .line 238
    const/4 v5, 0x1

    goto/16 :goto_0

    .line 240
    :cond_15
    if-lt v3, v4, :cond_16

    aget-byte v7, p0, v1

    const/16 v8, 0x2a

    if-ne v7, v8, :cond_16

    .line 242
    const/4 v5, 0x1

    .local v5, ok:Z
    move v2, v1

    .line 243
    .end local v1           #i:I
    .local v2, i:I
    :goto_5
    if-ge v2, v6, :cond_18

    .line 244
    add-int/lit8 v1, v2, 0x1

    .end local v2           #i:I
    .restart local v1       #i:I
    aget-byte v7, p0, v2

    const/16 v8, 0x2a

    if-eq v7, v8, :cond_17

    .line 245
    const/4 v5, 0x0

    .line 246
    goto/16 :goto_0

    .line 252
    .end local v5           #ok:Z
    :cond_16
    const/4 v5, 0x0

    goto/16 :goto_0

    .restart local v5       #ok:Z
    :cond_17
    move v2, v1

    .end local v1           #i:I
    .restart local v2       #i:I
    goto :goto_5

    :cond_18
    move v1, v2

    .end local v2           #i:I
    .restart local v1       #i:I
    goto/16 :goto_0
.end method

.method static glob([B[B)Z
    .locals 1
    .parameter "pattern"
    .parameter "name"

    .prologue
    const/4 v0, 0x0

    .line 128
    invoke-static {p0, v0, p1, v0}, Lcom/jcraft/jsch/Util;->glob0([BI[BI)Z

    move-result v0

    return v0
.end method

.method private static glob0([BI[BI)Z
    .locals 4
    .parameter "pattern"
    .parameter "pattern_index"
    .parameter "name"
    .parameter "name_index"

    .prologue
    const/16 v3, 0x2e

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 132
    array-length v2, p2

    if-lez v2, :cond_2

    aget-byte v2, p2, v1

    if-ne v2, v3, :cond_2

    .line 133
    array-length v2, p0

    if-lez v2, :cond_1

    aget-byte v2, p0, v1

    if-ne v2, v3, :cond_1

    .line 134
    array-length v1, p0

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    aget-byte v1, p0, v0

    const/16 v2, 0x2a

    if-ne v1, v2, :cond_0

    .line 139
    :goto_0
    return v0

    .line 135
    :cond_0
    add-int/lit8 v0, p1, 0x1

    add-int/lit8 v1, p3, 0x1

    invoke-static {p0, v0, p2, v1}, Lcom/jcraft/jsch/Util;->glob([BI[BI)Z

    move-result v0

    goto :goto_0

    :cond_1
    move v0, v1

    .line 137
    goto :goto_0

    .line 139
    :cond_2
    invoke-static {p0, p1, p2, p3}, Lcom/jcraft/jsch/Util;->glob([BI[BI)Z

    move-result v0

    goto :goto_0
.end method

.method static quote(Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .parameter "path"

    .prologue
    const/16 v10, 0x3f

    const/16 v9, 0x2a

    const/16 v8, 0x5c

    .line 256
    invoke-static {p0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    .line 257
    .local v0, _path:[B
    const/4 v3, 0x0

    .line 258
    .local v3, count:I
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    array-length v7, v0

    if-ge v4, v7, :cond_2

    .line 259
    aget-byte v2, v0, v4

    .line 260
    .local v2, b:B
    if-eq v2, v8, :cond_0

    if-eq v2, v10, :cond_0

    if-ne v2, v9, :cond_1

    .line 261
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 258
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 263
    .end local v2           #b:B
    :cond_2
    if-nez v3, :cond_3

    .line 273
    .end local p0
    :goto_1
    return-object p0

    .line 265
    .restart local p0
    :cond_3
    array-length v7, v0

    add-int/2addr v7, v3

    new-array v1, v7, [B

    .line 266
    .local v1, _path2:[B
    const/4 v4, 0x0

    const/4 v5, 0x0

    .local v5, j:I
    :goto_2
    array-length v7, v0

    if-ge v4, v7, :cond_6

    .line 267
    aget-byte v2, v0, v4

    .line 268
    .restart local v2       #b:B
    if-eq v2, v8, :cond_4

    if-eq v2, v10, :cond_4

    if-ne v2, v9, :cond_5

    .line 269
    :cond_4
    add-int/lit8 v6, v5, 0x1

    .end local v5           #j:I
    .local v6, j:I
    aput-byte v8, v1, v5

    move v5, v6

    .line 271
    .end local v6           #j:I
    .restart local v5       #j:I
    :cond_5
    add-int/lit8 v6, v5, 0x1

    .end local v5           #j:I
    .restart local v6       #j:I
    aput-byte v2, v1, v5

    .line 266
    add-int/lit8 v4, v4, 0x1

    move v5, v6

    .end local v6           #j:I
    .restart local v5       #j:I
    goto :goto_2

    .line 273
    .end local v2           #b:B
    :cond_6
    invoke-static {v1}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object p0

    goto :goto_1
.end method

.method private static skipUTF8Char(B)I
    .locals 3
    .parameter "b"

    .prologue
    const/4 v0, 0x1

    .line 483
    and-int/lit16 v1, p0, 0x80

    int-to-byte v1, v1

    if-nez v1, :cond_1

    .line 486
    :cond_0
    :goto_0
    return v0

    .line 484
    :cond_1
    and-int/lit16 v1, p0, 0xe0

    int-to-byte v1, v1

    const/16 v2, -0x40

    if-ne v1, v2, :cond_2

    const/4 v0, 0x2

    goto :goto_0

    .line 485
    :cond_2
    and-int/lit16 v1, p0, 0xf0

    int-to-byte v1, v1

    const/16 v2, -0x20

    if-ne v1, v2, :cond_0

    const/4 v0, 0x3

    goto :goto_0
.end method

.method static split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .locals 7
    .parameter "foo"
    .parameter "split"

    .prologue
    .line 105
    if-nez p0, :cond_1

    .line 106
    const/4 v4, 0x0

    .line 125
    :cond_0
    return-object v4

    .line 107
    :cond_1
    invoke-static {p0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v1

    .line 108
    .local v1, buf:[B
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    .line 109
    .local v0, bar:Ljava/util/Vector;
    const/4 v5, 0x0

    .line 112
    .local v5, start:I
    :goto_0
    invoke-virtual {p0, p1, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    .line 113
    .local v3, index:I
    if-ltz v3, :cond_2

    .line 114
    sub-int v6, v3, v5

    invoke-static {v1, v5, v6}, Lcom/jcraft/jsch/Util;->byte2str([BII)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 115
    add-int/lit8 v5, v3, 0x1

    .line 116
    goto :goto_0

    .line 118
    :cond_2
    array-length v6, v1

    sub-int/2addr v6, v5

    invoke-static {v1, v5, v6}, Lcom/jcraft/jsch/Util;->byte2str([BII)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 121
    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v6

    new-array v4, v6, [Ljava/lang/String;

    .line 122
    .local v4, result:[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1
    array-length v6, v4

    if-ge v2, v6, :cond_0

    .line 123
    invoke-virtual {v0, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    check-cast v6, Ljava/lang/String;

    aput-object v6, v4, v2

    .line 122
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method static str2byte(Ljava/lang/String;)[B
    .locals 1
    .parameter "str"

    .prologue
    .line 404
    const-string v0, "UTF-8"

    invoke-static {p0, v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method static str2byte(Ljava/lang/String;Ljava/lang/String;)[B
    .locals 2
    .parameter "str"
    .parameter "encoding"

    .prologue
    .line 395
    if-nez p0, :cond_0

    .line 396
    const/4 v1, 0x0

    .line 399
    :goto_0
    return-object v1

    .line 397
    :cond_0
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 398
    :catch_0
    move-exception v0

    .line 399
    .local v0, e:Ljava/io/UnsupportedEncodingException;
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    goto :goto_0
.end method

.method static toBase64([BII)[B
    .locals 11
    .parameter "buf"
    .parameter "start"
    .parameter "length"

    .prologue
    const/4 v10, 0x0

    const/16 v9, 0x3d

    .line 63
    mul-int/lit8 v7, p2, 0x2

    new-array v6, v7, [B

    .line 66
    .local v6, tmp:[B
    div-int/lit8 v7, p2, 0x3

    mul-int/lit8 v7, v7, 0x3

    add-int v1, v7, p1

    .line 67
    .local v1, foo:I
    const/4 v2, 0x0

    .line 68
    .local v2, i:I
    move v4, p1

    .local v4, j:I
    move v3, v2

    .end local v2           #i:I
    .local v3, i:I
    :goto_0
    if-ge v4, v1, :cond_0

    .line 69
    aget-byte v7, p0, v4

    ushr-int/lit8 v7, v7, 0x2

    and-int/lit8 v5, v7, 0x3f

    .line 70
    .local v5, k:I
    add-int/lit8 v2, v3, 0x1

    .end local v3           #i:I
    .restart local v2       #i:I
    sget-object v7, Lcom/jcraft/jsch/Util;->b64:[B

    aget-byte v7, v7, v5

    aput-byte v7, v6, v3

    .line 71
    aget-byte v7, p0, v4

    and-int/lit8 v7, v7, 0x3

    shl-int/lit8 v7, v7, 0x4

    add-int/lit8 v8, v4, 0x1

    aget-byte v8, p0, v8

    ushr-int/lit8 v8, v8, 0x4

    and-int/lit8 v8, v8, 0xf

    or-int v5, v7, v8

    .line 72
    add-int/lit8 v3, v2, 0x1

    .end local v2           #i:I
    .restart local v3       #i:I
    sget-object v7, Lcom/jcraft/jsch/Util;->b64:[B

    aget-byte v7, v7, v5

    aput-byte v7, v6, v2

    .line 73
    add-int/lit8 v7, v4, 0x1

    aget-byte v7, p0, v7

    and-int/lit8 v7, v7, 0xf

    shl-int/lit8 v7, v7, 0x2

    add-int/lit8 v8, v4, 0x2

    aget-byte v8, p0, v8

    ushr-int/lit8 v8, v8, 0x6

    and-int/lit8 v8, v8, 0x3

    or-int v5, v7, v8

    .line 74
    add-int/lit8 v2, v3, 0x1

    .end local v3           #i:I
    .restart local v2       #i:I
    sget-object v7, Lcom/jcraft/jsch/Util;->b64:[B

    aget-byte v7, v7, v5

    aput-byte v7, v6, v3

    .line 75
    add-int/lit8 v7, v4, 0x2

    aget-byte v7, p0, v7

    and-int/lit8 v5, v7, 0x3f

    .line 76
    add-int/lit8 v3, v2, 0x1

    .end local v2           #i:I
    .restart local v3       #i:I
    sget-object v7, Lcom/jcraft/jsch/Util;->b64:[B

    aget-byte v7, v7, v5

    aput-byte v7, v6, v2

    .line 68
    add-int/lit8 v4, v4, 0x3

    goto :goto_0

    .line 79
    .end local v5           #k:I
    :cond_0
    add-int v7, p1, p2

    sub-int v1, v7, v1

    .line 80
    const/4 v7, 0x1

    if-ne v1, v7, :cond_1

    .line 81
    aget-byte v7, p0, v4

    ushr-int/lit8 v7, v7, 0x2

    and-int/lit8 v5, v7, 0x3f

    .line 82
    .restart local v5       #k:I
    add-int/lit8 v2, v3, 0x1

    .end local v3           #i:I
    .restart local v2       #i:I
    sget-object v7, Lcom/jcraft/jsch/Util;->b64:[B

    aget-byte v7, v7, v5

    aput-byte v7, v6, v3

    .line 83
    aget-byte v7, p0, v4

    and-int/lit8 v7, v7, 0x3

    shl-int/lit8 v7, v7, 0x4

    and-int/lit8 v5, v7, 0x3f

    .line 84
    add-int/lit8 v3, v2, 0x1

    .end local v2           #i:I
    .restart local v3       #i:I
    sget-object v7, Lcom/jcraft/jsch/Util;->b64:[B

    aget-byte v7, v7, v5

    aput-byte v7, v6, v2

    .line 85
    add-int/lit8 v2, v3, 0x1

    .end local v3           #i:I
    .restart local v2       #i:I
    aput-byte v9, v6, v3

    .line 86
    add-int/lit8 v3, v2, 0x1

    .end local v2           #i:I
    .restart local v3       #i:I
    aput-byte v9, v6, v2

    move v2, v3

    .line 97
    .end local v3           #i:I
    .end local v5           #k:I
    .restart local v2       #i:I
    :goto_1
    new-array v0, v2, [B

    .line 98
    .local v0, bar:[B
    invoke-static {v6, v10, v0, v10, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 99
    return-object v0

    .line 88
    .end local v0           #bar:[B
    .end local v2           #i:I
    .restart local v3       #i:I
    :cond_1
    const/4 v7, 0x2

    if-ne v1, v7, :cond_2

    .line 89
    aget-byte v7, p0, v4

    ushr-int/lit8 v7, v7, 0x2

    and-int/lit8 v5, v7, 0x3f

    .line 90
    .restart local v5       #k:I
    add-int/lit8 v2, v3, 0x1

    .end local v3           #i:I
    .restart local v2       #i:I
    sget-object v7, Lcom/jcraft/jsch/Util;->b64:[B

    aget-byte v7, v7, v5

    aput-byte v7, v6, v3

    .line 91
    aget-byte v7, p0, v4

    and-int/lit8 v7, v7, 0x3

    shl-int/lit8 v7, v7, 0x4

    add-int/lit8 v8, v4, 0x1

    aget-byte v8, p0, v8

    ushr-int/lit8 v8, v8, 0x4

    and-int/lit8 v8, v8, 0xf

    or-int v5, v7, v8

    .line 92
    add-int/lit8 v3, v2, 0x1

    .end local v2           #i:I
    .restart local v3       #i:I
    sget-object v7, Lcom/jcraft/jsch/Util;->b64:[B

    aget-byte v7, v7, v5

    aput-byte v7, v6, v2

    .line 93
    add-int/lit8 v7, v4, 0x1

    aget-byte v7, p0, v7

    and-int/lit8 v7, v7, 0xf

    shl-int/lit8 v7, v7, 0x2

    and-int/lit8 v5, v7, 0x3f

    .line 94
    add-int/lit8 v2, v3, 0x1

    .end local v3           #i:I
    .restart local v2       #i:I
    sget-object v7, Lcom/jcraft/jsch/Util;->b64:[B

    aget-byte v7, v7, v5

    aput-byte v7, v6, v3

    .line 95
    add-int/lit8 v3, v2, 0x1

    .end local v2           #i:I
    .restart local v3       #i:I
    aput-byte v9, v6, v2

    .end local v5           #k:I
    :cond_2
    move v2, v3

    .end local v3           #i:I
    .restart local v2       #i:I
    goto :goto_1
.end method

.method static unquote(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "path"

    .prologue
    .line 277
    invoke-static {p0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v1

    .line 278
    .local v1, foo:[B
    invoke-static {v1}, Lcom/jcraft/jsch/Util;->unquote([B)[B

    move-result-object v0

    .line 279
    .local v0, bar:[B
    array-length v2, v1

    array-length v3, v0

    if-ne v2, v3, :cond_0

    .line 281
    .end local p0
    :goto_0
    return-object p0

    .restart local p0
    :cond_0
    invoke-static {v0}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method static unquote([B)[B
    .locals 7
    .parameter "path"

    .prologue
    const/4 v6, 0x0

    .line 284
    array-length v2, p0

    .line 285
    .local v2, pathlen:I
    const/4 v1, 0x0

    .line 286
    .local v1, i:I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 287
    aget-byte v3, p0, v1

    const/16 v4, 0x5c

    if-ne v3, v4, :cond_2

    .line 288
    add-int/lit8 v3, v1, 0x1

    if-ne v3, v2, :cond_1

    .line 297
    :cond_0
    array-length v3, p0

    if-ne v2, v3, :cond_3

    .line 301
    .end local p0
    :goto_1
    return-object p0

    .line 290
    .restart local p0
    :cond_1
    add-int/lit8 v3, v1, 0x1

    array-length v4, p0

    add-int/lit8 v5, v1, 0x1

    sub-int/2addr v4, v5

    invoke-static {p0, v3, p0, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 291
    add-int/lit8 v2, v2, -0x1

    .line 292
    add-int/lit8 v1, v1, 0x1

    .line 293
    goto :goto_0

    .line 295
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 299
    :cond_3
    new-array v0, v2, [B

    .line 300
    .local v0, foo:[B
    invoke-static {p0, v6, v0, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object p0, v0

    .line 301
    goto :goto_1
.end method

.method private static val(B)B
    .locals 3
    .parameter "foo"

    .prologue
    const/4 v1, 0x0

    .line 40
    const/16 v2, 0x3d

    if-ne p0, v2, :cond_1

    .line 44
    :cond_0
    :goto_0
    return v1

    .line 41
    :cond_1
    const/4 v0, 0x0

    .local v0, j:I
    :goto_1
    sget-object v2, Lcom/jcraft/jsch/Util;->b64:[B

    array-length v2, v2

    if-ge v0, v2, :cond_0

    .line 42
    sget-object v2, Lcom/jcraft/jsch/Util;->b64:[B

    aget-byte v2, v2, v0

    if-ne p0, v2, :cond_2

    int-to-byte v1, v0

    goto :goto_0

    .line 41
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method
