.class public Lorg/eclipse/jgit/transport/CredentialItem$Username;
.super Lorg/eclipse/jgit/transport/CredentialItem$StringType;
.source "CredentialItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/CredentialItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Username"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 272
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->credentialUsername:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/eclipse/jgit/transport/CredentialItem$StringType;-><init>(Ljava/lang/String;Z)V

    .line 273
    return-void
.end method
