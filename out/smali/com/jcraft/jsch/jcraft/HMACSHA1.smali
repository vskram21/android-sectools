.class public Lcom/jcraft/jsch/jcraft/HMACSHA1;
.super Lcom/jcraft/jsch/jcraft/HMAC;
.source "HMACSHA1.java"

# interfaces
.implements Lcom/jcraft/jsch/MAC;


# static fields
.field private static final name:Ljava/lang/String; = "hmac-sha1"


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/jcraft/jsch/jcraft/HMAC;-><init>()V

    .line 40
    const/4 v1, 0x0

    .line 41
    .local v1, md:Ljava/security/MessageDigest;
    :try_start_0
    const-string v2, "SHA-1"

    invoke-static {v2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 45
    :goto_0
    invoke-virtual {p0, v1}, Lcom/jcraft/jsch/jcraft/HMACSHA1;->setH(Ljava/security/MessageDigest;)V

    .line 46
    return-void

    .line 42
    :catch_0
    move-exception v0

    .line 43
    .local v0, e:Ljava/lang/Exception;
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v2, v0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto :goto_0
.end method


# virtual methods
.method public bridge synthetic doFinal([BI)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 35
    invoke-super {p0, p1, p2}, Lcom/jcraft/jsch/jcraft/HMAC;->doFinal([BI)V

    return-void
.end method

.method public bridge synthetic getBlockSize()I
    .locals 1

    .prologue
    .line 35
    invoke-super {p0}, Lcom/jcraft/jsch/jcraft/HMAC;->getBlockSize()I

    move-result v0

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    const-string v0, "hmac-sha1"

    return-object v0
.end method

.method public bridge synthetic init([B)V
    .locals 0
    .parameter "x0"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 35
    invoke-super {p0, p1}, Lcom/jcraft/jsch/jcraft/HMAC;->init([B)V

    return-void
.end method

.method public bridge synthetic update(I)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 35
    invoke-super {p0, p1}, Lcom/jcraft/jsch/jcraft/HMAC;->update(I)V

    return-void
.end method

.method public bridge synthetic update([BII)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 35
    invoke-super {p0, p1, p2, p3}, Lcom/jcraft/jsch/jcraft/HMAC;->update([BII)V

    return-void
.end method
