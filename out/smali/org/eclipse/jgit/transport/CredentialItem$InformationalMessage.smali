.class public Lorg/eclipse/jgit/transport/CredentialItem$InformationalMessage;
.super Lorg/eclipse/jgit/transport/CredentialItem;
.source "CredentialItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/CredentialItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InformationalMessage"
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "messageText"

    .prologue
    .line 259
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/transport/CredentialItem;-><init>(Ljava/lang/String;Z)V

    .line 260
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 0

    .prologue
    .line 265
    return-void
.end method
