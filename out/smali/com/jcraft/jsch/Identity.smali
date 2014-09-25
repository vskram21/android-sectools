.class public interface abstract Lcom/jcraft/jsch/Identity;
.super Ljava/lang/Object;
.source "Identity.java"


# virtual methods
.method public abstract clear()V
.end method

.method public abstract decrypt()Z
.end method

.method public abstract getAlgName()Ljava/lang/String;
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public abstract getPublicKeyBlob()[B
.end method

.method public abstract getSignature([B)[B
.end method

.method public abstract isEncrypted()Z
.end method

.method public abstract setPassphrase([B)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation
.end method
