.class public interface abstract Lcom/jcraft/jsch/Cipher;
.super Ljava/lang/Object;
.source "Cipher.java"


# static fields
.field public static final DECRYPT_MODE:I = 0x1

.field public static final ENCRYPT_MODE:I


# virtual methods
.method public abstract getBlockSize()I
.end method

.method public abstract getIVSize()I
.end method

.method public abstract init(I[B[B)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public abstract isCBC()Z
.end method

.method public abstract update([BII[BI)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method
