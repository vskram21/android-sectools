.class Lcom/zeapo/pwdstore/GitHandler$SshConfigSessionFactory$1;
.super Lorg/eclipse/jgit/transport/CredentialsProvider;
.source "GitHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zeapo/pwdstore/GitHandler$SshConfigSessionFactory;->configure(Lorg/eclipse/jgit/transport/OpenSshConfig$Host;Lcom/jcraft/jsch/Session;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/zeapo/pwdstore/GitHandler$SshConfigSessionFactory;


# direct methods
.method constructor <init>(Lcom/zeapo/pwdstore/GitHandler$SshConfigSessionFactory;)V
    .locals 0
    .parameter

    .prologue
    .line 237
    iput-object p1, p0, Lcom/zeapo/pwdstore/GitHandler$SshConfigSessionFactory$1;->this$1:Lcom/zeapo/pwdstore/GitHandler$SshConfigSessionFactory;

    invoke-direct {p0}, Lorg/eclipse/jgit/transport/CredentialsProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs get(Lorg/eclipse/jgit/transport/URIish;[Lorg/eclipse/jgit/transport/CredentialItem;)Z
    .locals 7
    .parameter "uri"
    .parameter "items"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/UnsupportedCredentialItem;
        }
    .end annotation

    .prologue
    .line 250
    move-object v0, p2

    .local v0, arr$:[Lorg/eclipse/jgit/transport/CredentialItem;
    array-length v3, v0

    .local v3, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v3, :cond_2

    aget-object v2, v0, v1

    .line 251
    .local v2, item:Lorg/eclipse/jgit/transport/CredentialItem;
    instance-of v4, v2, Lorg/eclipse/jgit/transport/CredentialItem$Username;

    if-eqz v4, :cond_1

    .line 252
    check-cast v2, Lorg/eclipse/jgit/transport/CredentialItem$Username;

    .end local v2           #item:Lorg/eclipse/jgit/transport/CredentialItem;
    iget-object v4, p0, Lcom/zeapo/pwdstore/GitHandler$SshConfigSessionFactory$1;->this$1:Lcom/zeapo/pwdstore/GitHandler$SshConfigSessionFactory;

    iget-object v4, v4, Lcom/zeapo/pwdstore/GitHandler$SshConfigSessionFactory;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    #getter for: Lcom/zeapo/pwdstore/GitHandler;->settings:Landroid/content/SharedPreferences;
    invoke-static {v4}, Lcom/zeapo/pwdstore/GitHandler;->access$300(Lcom/zeapo/pwdstore/GitHandler;)Landroid/content/SharedPreferences;

    move-result-object v4

    const-string v5, "git_remote_username"

    const-string v6, "git"

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/eclipse/jgit/transport/CredentialItem$Username;->setValue(Ljava/lang/String;)V

    .line 250
    :cond_0
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 255
    .restart local v2       #item:Lorg/eclipse/jgit/transport/CredentialItem;
    :cond_1
    instance-of v4, v2, Lorg/eclipse/jgit/transport/CredentialItem$StringType;

    if-eqz v4, :cond_0

    .line 256
    check-cast v2, Lorg/eclipse/jgit/transport/CredentialItem$StringType;

    .end local v2           #item:Lorg/eclipse/jgit/transport/CredentialItem;
    iget-object v4, p0, Lcom/zeapo/pwdstore/GitHandler$SshConfigSessionFactory$1;->this$1:Lcom/zeapo/pwdstore/GitHandler$SshConfigSessionFactory;

    #getter for: Lcom/zeapo/pwdstore/GitHandler$SshConfigSessionFactory;->passphrase:Ljava/lang/String;
    invoke-static {v4}, Lcom/zeapo/pwdstore/GitHandler$SshConfigSessionFactory;->access$400(Lcom/zeapo/pwdstore/GitHandler$SshConfigSessionFactory;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/eclipse/jgit/transport/CredentialItem$StringType;->setValue(Ljava/lang/String;)V

    goto :goto_1

    .line 259
    :cond_2
    const/4 v4, 0x1

    return v4
.end method

.method public isInteractive()Z
    .locals 1

    .prologue
    .line 240
    const/4 v0, 0x0

    return v0
.end method

.method public varargs supports([Lorg/eclipse/jgit/transport/CredentialItem;)Z
    .locals 1
    .parameter "items"

    .prologue
    .line 245
    const/4 v0, 0x1

    return v0
.end method
