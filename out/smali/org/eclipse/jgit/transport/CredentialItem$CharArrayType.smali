.class public Lorg/eclipse/jgit/transport/CredentialItem$CharArrayType;
.super Lorg/eclipse/jgit/transport/CredentialItem;
.source "CredentialItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/CredentialItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CharArrayType"
.end annotation


# instance fields
.field private value:[C


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 0
    .parameter "promptText"
    .parameter "maskValue"

    .prologue
    .line 161
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/transport/CredentialItem;-><init>(Ljava/lang/String;Z)V

    .line 162
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 2

    .prologue
    .line 167
    iget-object v0, p0, Lorg/eclipse/jgit/transport/CredentialItem$CharArrayType;->value:[C

    if-eqz v0, :cond_0

    .line 168
    iget-object v0, p0, Lorg/eclipse/jgit/transport/CredentialItem$CharArrayType;->value:[C

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([CC)V

    .line 169
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/CredentialItem$CharArrayType;->value:[C

    .line 171
    :cond_0
    return-void
.end method

.method public getValue()[C
    .locals 1

    .prologue
    .line 184
    iget-object v0, p0, Lorg/eclipse/jgit/transport/CredentialItem$CharArrayType;->value:[C

    return-object v0
.end method

.method public setValue([C)V
    .locals 3
    .parameter "newValue"

    .prologue
    const/4 v2, 0x0

    .line 194
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/CredentialItem$CharArrayType;->clear()V

    .line 196
    if-eqz p1, :cond_0

    .line 197
    array-length v0, p1

    new-array v0, v0, [C

    iput-object v0, p0, Lorg/eclipse/jgit/transport/CredentialItem$CharArrayType;->value:[C

    .line 198
    iget-object v0, p0, Lorg/eclipse/jgit/transport/CredentialItem$CharArrayType;->value:[C

    array-length v1, p1

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 200
    :cond_0
    return-void
.end method

.method public setValueNoCopy([C)V
    .locals 0
    .parameter "newValue"

    .prologue
    .line 209
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/CredentialItem$CharArrayType;->clear()V

    .line 210
    iput-object p1, p0, Lorg/eclipse/jgit/transport/CredentialItem$CharArrayType;->value:[C

    .line 211
    return-void
.end method
