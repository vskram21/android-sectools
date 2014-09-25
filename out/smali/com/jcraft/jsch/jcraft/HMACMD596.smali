.class public Lcom/jcraft/jsch/jcraft/HMACMD596;
.super Lcom/jcraft/jsch/jcraft/HMACMD5;
.source "HMACMD596.java"


# static fields
.field private static final BSIZE:I = 0xc

.field private static final name:Ljava/lang/String; = "hmac-md5-96"


# instance fields
.field private final _buf16:[B


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/jcraft/jsch/jcraft/HMACMD5;-><init>()V

    .line 41
    const/16 v0, 0x10

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/jcraft/jsch/jcraft/HMACMD596;->_buf16:[B

    return-void
.end method


# virtual methods
.method public doFinal([BI)V
    .locals 3
    .parameter "buf"
    .parameter "offset"

    .prologue
    const/4 v2, 0x0

    .line 43
    iget-object v0, p0, Lcom/jcraft/jsch/jcraft/HMACMD596;->_buf16:[B

    invoke-super {p0, v0, v2}, Lcom/jcraft/jsch/jcraft/HMACMD5;->doFinal([BI)V

    .line 44
    iget-object v0, p0, Lcom/jcraft/jsch/jcraft/HMACMD596;->_buf16:[B

    const/16 v1, 0xc

    invoke-static {v0, v2, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 45
    return-void
.end method

.method public getBlockSize()I
    .locals 1

    .prologue
    .line 39
    const/16 v0, 0xc

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 48
    const-string v0, "hmac-md5-96"

    return-object v0
.end method
