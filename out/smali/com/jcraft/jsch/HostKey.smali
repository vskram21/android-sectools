.class public Lcom/jcraft/jsch/HostKey;
.super Ljava/lang/Object;
.source "HostKey.java"


# static fields
.field protected static final GUESS:I = 0x0

.field public static final SSHDSS:I = 0x1

.field public static final SSHRSA:I = 0x2

.field static final UNKNOWN:I = 0x3

.field private static final sshdss:[B

.field private static final sshrsa:[B


# instance fields
.field protected comment:Ljava/lang/String;

.field protected host:Ljava/lang/String;

.field protected key:[B

.field protected marker:Ljava/lang/String;

.field protected type:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    const-string v0, "ssh-dss"

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/jcraft/jsch/HostKey;->sshdss:[B

    .line 34
    const-string v0, "ssh-rsa"

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/jcraft/jsch/HostKey;->sshrsa:[B

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I[B)V
    .locals 1
    .parameter "host"
    .parameter "type"
    .parameter "key"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 52
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/jcraft/jsch/HostKey;-><init>(Ljava/lang/String;I[BLjava/lang/String;)V

    .line 53
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I[BLjava/lang/String;)V
    .locals 6
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
    .line 55
    const-string v1, ""

    move-object v0, p0

    move-object v2, p1

    move v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/jcraft/jsch/HostKey;-><init>(Ljava/lang/String;Ljava/lang/String;I[BLjava/lang/String;)V

    .line 56
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;I[BLjava/lang/String;)V
    .locals 3
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
    const/16 v2, 0x8

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object p1, p0, Lcom/jcraft/jsch/HostKey;->marker:Ljava/lang/String;

    .line 59
    iput-object p2, p0, Lcom/jcraft/jsch/HostKey;->host:Ljava/lang/String;

    .line 60
    if-nez p3, :cond_2

    .line 61
    aget-byte v0, p4, v2

    const/16 v1, 0x64

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    iput v0, p0, Lcom/jcraft/jsch/HostKey;->type:I

    .line 68
    :goto_0
    iput-object p4, p0, Lcom/jcraft/jsch/HostKey;->key:[B

    .line 69
    iput-object p5, p0, Lcom/jcraft/jsch/HostKey;->comment:Ljava/lang/String;

    .line 70
    return-void

    .line 62
    :cond_0
    aget-byte v0, p4, v2

    const/16 v1, 0x72

    if-ne v0, v1, :cond_1

    const/4 v0, 0x2

    iput v0, p0, Lcom/jcraft/jsch/HostKey;->type:I

    goto :goto_0

    .line 63
    :cond_1
    new-instance v0, Lcom/jcraft/jsch/JSchException;

    const-string v1, "invalid key type"

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 66
    :cond_2
    iput p3, p0, Lcom/jcraft/jsch/HostKey;->type:I

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/String;[B)V
    .locals 1
    .parameter "host"
    .parameter "key"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 48
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lcom/jcraft/jsch/HostKey;-><init>(Ljava/lang/String;I[B)V

    .line 49
    return-void
.end method

.method private isIncluded(Ljava/lang/String;)Z
    .locals 8
    .parameter "_host"

    .prologue
    const/4 v1, 0x1

    const/4 v4, 0x0

    .line 98
    const/4 v2, 0x0

    .line 99
    .local v2, i:I
    iget-object v0, p0, Lcom/jcraft/jsch/HostKey;->host:Ljava/lang/String;

    .line 100
    .local v0, hosts:Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v6

    .line 101
    .local v6, hostslen:I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    .line 103
    .local v5, hostlen:I
    :goto_0
    if-ge v2, v6, :cond_0

    .line 104
    const/16 v3, 0x2c

    invoke-virtual {v0, v3, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v7

    .line 105
    .local v7, j:I
    const/4 v3, -0x1

    if-ne v7, v3, :cond_2

    .line 106
    sub-int v3, v6, v2

    if-eq v5, v3, :cond_1

    .line 114
    .end local v7           #j:I
    :cond_0
    :goto_1
    return v4

    .restart local v7       #j:I
    :cond_1
    move-object v3, p1

    .line 107
    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v4

    goto :goto_1

    .line 109
    :cond_2
    sub-int v3, v7, v2

    if-ne v5, v3, :cond_3

    move-object v3, p1

    .line 110
    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v3

    if-eqz v3, :cond_3

    move v4, v1

    goto :goto_1

    .line 112
    :cond_3
    add-int/lit8 v2, v7, 0x1

    goto :goto_0
.end method


# virtual methods
.method public getComment()Ljava/lang/String;
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lcom/jcraft/jsch/HostKey;->comment:Ljava/lang/String;

    return-object v0
.end method

.method public getFingerPrint(Lcom/jcraft/jsch/JSch;)Ljava/lang/String;
    .locals 7
    .parameter "jsch"

    .prologue
    .line 82
    const/4 v3, 0x0

    .line 84
    .local v3, hash:Lcom/jcraft/jsch/HASH;
    :try_start_0
    const-string v4, "md5"

    invoke-static {v4}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 85
    .local v1, c:Ljava/lang/Class;
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/jcraft/jsch/HASH;

    move-object v0, v4

    check-cast v0, Lcom/jcraft/jsch/HASH;

    move-object v3, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 88
    .end local v1           #c:Ljava/lang/Class;
    :goto_0
    iget-object v4, p0, Lcom/jcraft/jsch/HostKey;->key:[B

    invoke-static {v3, v4}, Lcom/jcraft/jsch/Util;->getFingerPrint(Lcom/jcraft/jsch/HASH;[B)Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 87
    :catch_0
    move-exception v2

    .local v2, e:Ljava/lang/Exception;
    sget-object v4, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "getFingerPrint: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public getHost()Ljava/lang/String;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/jcraft/jsch/HostKey;->host:Ljava/lang/String;

    return-object v0
.end method

.method public getKey()Ljava/lang/String;
    .locals 3

    .prologue
    .line 79
    iget-object v0, p0, Lcom/jcraft/jsch/HostKey;->key:[B

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/jcraft/jsch/HostKey;->key:[B

    array-length v2, v2

    invoke-static {v0, v1, v2}, Lcom/jcraft/jsch/Util;->toBase64([BII)[B

    move-result-object v0

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMarker()Ljava/lang/String;
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lcom/jcraft/jsch/HostKey;->marker:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 2

    .prologue
    .line 74
    iget v0, p0, Lcom/jcraft/jsch/HostKey;->type:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    sget-object v0, Lcom/jcraft/jsch/HostKey;->sshdss:[B

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v0

    .line 76
    :goto_0
    return-object v0

    .line 75
    :cond_0
    iget v0, p0, Lcom/jcraft/jsch/HostKey;->type:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    sget-object v0, Lcom/jcraft/jsch/HostKey;->sshrsa:[B

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 76
    :cond_1
    const-string v0, "UNKNOWN"

    goto :goto_0
.end method

.method isMatched(Ljava/lang/String;)Z
    .locals 1
    .parameter "_host"

    .prologue
    .line 94
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/HostKey;->isIncluded(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
