.class final Lcom/jcraft/jsch/JSch$1;
.super Ljava/lang/Object;
.source "JSch.java"

# interfaces
.implements Lcom/jcraft/jsch/Logger;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jcraft/jsch/JSch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 167
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isEnabled(I)Z
    .locals 1
    .parameter "level"

    .prologue
    .line 168
    const/4 v0, 0x0

    return v0
.end method

.method public log(ILjava/lang/String;)V
    .locals 0
    .parameter "level"
    .parameter "message"

    .prologue
    .line 169
    return-void
.end method
