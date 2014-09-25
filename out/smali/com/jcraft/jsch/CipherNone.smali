.class public Lcom/jcraft/jsch/CipherNone;
.super Ljava/lang/Object;
.source "CipherNone.java"

# interfaces
.implements Lcom/jcraft/jsch/Cipher;


# static fields
.field private static final bsize:I = 0x10

.field private static final ivsize:I = 0x8


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getBlockSize()I
    .locals 1

    .prologue
    .line 36
    const/16 v0, 0x10

    return v0
.end method

.method public getIVSize()I
    .locals 1

    .prologue
    .line 35
    const/16 v0, 0x8

    return v0
.end method

.method public init(I[B[B)V
    .locals 0
    .parameter "mode"
    .parameter "key"
    .parameter "iv"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 38
    return-void
.end method

.method public isCBC()Z
    .locals 1

    .prologue
    .line 41
    const/4 v0, 0x0

    return v0
.end method

.method public update([BII[BI)V
    .locals 0
    .parameter "foo"
    .parameter "s1"
    .parameter "len"
    .parameter "bar"
    .parameter "s2"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 40
    return-void
.end method
