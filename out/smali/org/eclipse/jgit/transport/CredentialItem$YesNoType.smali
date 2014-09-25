.class public Lorg/eclipse/jgit/transport/CredentialItem$YesNoType;
.super Lorg/eclipse/jgit/transport/CredentialItem;
.source "CredentialItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/CredentialItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "YesNoType"
.end annotation


# instance fields
.field private value:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "promptText"

    .prologue
    .line 227
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/transport/CredentialItem;-><init>(Ljava/lang/String;Z)V

    .line 228
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 232
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/CredentialItem$YesNoType;->value:Z

    .line 233
    return-void
.end method

.method public getValue()Z
    .locals 1

    .prologue
    .line 237
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/CredentialItem$YesNoType;->value:Z

    return v0
.end method

.method public setValue(Z)V
    .locals 0
    .parameter "newValue"

    .prologue
    .line 246
    iput-boolean p1, p0, Lorg/eclipse/jgit/transport/CredentialItem$YesNoType;->value:Z

    .line 247
    return-void
.end method
