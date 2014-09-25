.class public Lorg/eclipse/jgit/transport/CredentialItem$Password;
.super Lorg/eclipse/jgit/transport/CredentialItem$CharArrayType;
.source "CredentialItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/CredentialItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Password"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 280
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->credentialPassword:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lorg/eclipse/jgit/transport/CredentialItem$CharArrayType;-><init>(Ljava/lang/String;Z)V

    .line 281
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 290
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/transport/CredentialItem$CharArrayType;-><init>(Ljava/lang/String;Z)V

    .line 291
    return-void
.end method
