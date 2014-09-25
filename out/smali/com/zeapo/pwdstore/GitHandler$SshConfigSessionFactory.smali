.class public Lcom/zeapo/pwdstore/GitHandler$SshConfigSessionFactory;
.super Lcom/zeapo/pwdstore/GitHandler$GitConfigSessionFactory;
.source "GitHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zeapo/pwdstore/GitHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "SshConfigSessionFactory"
.end annotation


# instance fields
.field private passphrase:Ljava/lang/String;

.field private sshKey:Ljava/lang/String;

.field final synthetic this$0:Lcom/zeapo/pwdstore/GitHandler;


# direct methods
.method public constructor <init>(Lcom/zeapo/pwdstore/GitHandler;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter "sshKey"
    .parameter "passphrase"

    .prologue
    .line 219
    iput-object p1, p0, Lcom/zeapo/pwdstore/GitHandler$SshConfigSessionFactory;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    invoke-direct {p0, p1}, Lcom/zeapo/pwdstore/GitHandler$GitConfigSessionFactory;-><init>(Lcom/zeapo/pwdstore/GitHandler;)V

    .line 220
    iput-object p2, p0, Lcom/zeapo/pwdstore/GitHandler$SshConfigSessionFactory;->sshKey:Ljava/lang/String;

    .line 221
    iput-object p3, p0, Lcom/zeapo/pwdstore/GitHandler$SshConfigSessionFactory;->passphrase:Ljava/lang/String;

    .line 222
    return-void
.end method

.method static synthetic access$400(Lcom/zeapo/pwdstore/GitHandler$SshConfigSessionFactory;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 215
    iget-object v0, p0, Lcom/zeapo/pwdstore/GitHandler$SshConfigSessionFactory;->passphrase:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method protected configure(Lorg/eclipse/jgit/transport/OpenSshConfig$Host;Lcom/jcraft/jsch/Session;)V
    .locals 4
    .parameter "hc"
    .parameter "session"

    .prologue
    .line 235
    const-string v2, "StrictHostKeyChecking"

    const-string v3, "no"

    invoke-virtual {p2, v2, v3}, Lcom/jcraft/jsch/Session;->setConfig(Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    new-instance v0, Lcom/zeapo/pwdstore/GitHandler$SshConfigSessionFactory$1;

    invoke-direct {v0, p0}, Lcom/zeapo/pwdstore/GitHandler$SshConfigSessionFactory$1;-><init>(Lcom/zeapo/pwdstore/GitHandler$SshConfigSessionFactory;)V

    .line 262
    .local v0, provider:Lorg/eclipse/jgit/transport/CredentialsProvider;
    new-instance v1, Lorg/eclipse/jgit/transport/CredentialsProviderUserInfo;

    invoke-direct {v1, p2, v0}, Lorg/eclipse/jgit/transport/CredentialsProviderUserInfo;-><init>(Lcom/jcraft/jsch/Session;Lorg/eclipse/jgit/transport/CredentialsProvider;)V

    .line 263
    .local v1, userInfo:Lcom/jcraft/jsch/UserInfo;
    invoke-virtual {p2, v1}, Lcom/jcraft/jsch/Session;->setUserInfo(Lcom/jcraft/jsch/UserInfo;)V

    .line 264
    return-void
.end method

.method protected getJSch(Lorg/eclipse/jgit/transport/OpenSshConfig$Host;Lorg/eclipse/jgit/util/FS;)Lcom/jcraft/jsch/JSch;
    .locals 2
    .parameter "hc"
    .parameter "fs"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 227
    invoke-super {p0, p1, p2}, Lcom/zeapo/pwdstore/GitHandler$GitConfigSessionFactory;->getJSch(Lorg/eclipse/jgit/transport/OpenSshConfig$Host;Lorg/eclipse/jgit/util/FS;)Lcom/jcraft/jsch/JSch;

    move-result-object v0

    .line 228
    .local v0, jsch:Lcom/jcraft/jsch/JSch;
    invoke-virtual {v0}, Lcom/jcraft/jsch/JSch;->removeAllIdentity()V

    .line 229
    iget-object v1, p0, Lcom/zeapo/pwdstore/GitHandler$SshConfigSessionFactory;->sshKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/JSch;->addIdentity(Ljava/lang/String;)V

    .line 230
    return-object v0
.end method
