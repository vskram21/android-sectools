.class public Lcom/jcraft/jsch/jce/HMACSHA196;
.super Lcom/jcraft/jsch/jce/HMACSHA1;
.source "HMACSHA196.java"


# instance fields
.field private final _buf20:[B


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/jcraft/jsch/jce/HMACSHA1;-><init>()V

    .line 42
    const/16 v0, 0x14

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/jcraft/jsch/jce/HMACSHA196;->_buf20:[B

    .line 35
    const-string v0, "hmac-sha1-96"

    iput-object v0, p0, Lcom/jcraft/jsch/jce/HMACSHA196;->name:Ljava/lang/String;

    .line 36
    return-void
.end method


# virtual methods
.method public doFinal([BI)V
    .locals 3
    .parameter "buf"
    .parameter "offset"

    .prologue
    const/4 v2, 0x0

    .line 44
    iget-object v0, p0, Lcom/jcraft/jsch/jce/HMACSHA196;->_buf20:[B

    invoke-super {p0, v0, v2}, Lcom/jcraft/jsch/jce/HMACSHA1;->doFinal([BI)V

    .line 45
    iget-object v0, p0, Lcom/jcraft/jsch/jce/HMACSHA196;->_buf20:[B

    const/16 v1, 0xc

    invoke-static {v0, v2, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 46
    return-void
.end method

.method public getBlockSize()I
    .locals 1

    .prologue
    .line 39
    const/16 v0, 0xc

    return v0
.end method
