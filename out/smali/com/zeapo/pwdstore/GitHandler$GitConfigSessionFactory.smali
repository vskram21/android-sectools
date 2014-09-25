.class public Lcom/zeapo/pwdstore/GitHandler$GitConfigSessionFactory;
.super Lorg/eclipse/jgit/transport/JschConfigSessionFactory;
.source "GitHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zeapo/pwdstore/GitHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "GitConfigSessionFactory"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zeapo/pwdstore/GitHandler;


# direct methods
.method protected constructor <init>(Lcom/zeapo/pwdstore/GitHandler;)V
    .locals 0
    .parameter

    .prologue
    .line 200
    iput-object p1, p0, Lcom/zeapo/pwdstore/GitHandler$GitConfigSessionFactory;->this$0:Lcom/zeapo/pwdstore/GitHandler;

    invoke-direct {p0}, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;-><init>()V

    return-void
.end method


# virtual methods
.method protected configure(Lorg/eclipse/jgit/transport/OpenSshConfig$Host;Lcom/jcraft/jsch/Session;)V
    .locals 2
    .parameter "hc"
    .parameter "session"

    .prologue
    .line 203
    const-string v0, "StrictHostKeyChecking"

    const-string v1, "no"

    invoke-virtual {p2, v0, v1}, Lcom/jcraft/jsch/Session;->setConfig(Ljava/lang/String;Ljava/lang/String;)V

    .line 204
    return-void
.end method

.method protected getJSch(Lorg/eclipse/jgit/transport/OpenSshConfig$Host;Lorg/eclipse/jgit/util/FS;)Lcom/jcraft/jsch/JSch;
    .locals 1
    .parameter "hc"
    .parameter "fs"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 209
    invoke-super {p0, p1, p2}, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;->getJSch(Lorg/eclipse/jgit/transport/OpenSshConfig$Host;Lorg/eclipse/jgit/util/FS;)Lcom/jcraft/jsch/JSch;

    move-result-object v0

    .line 210
    .local v0, jsch:Lcom/jcraft/jsch/JSch;
    invoke-virtual {v0}, Lcom/jcraft/jsch/JSch;->removeAllIdentity()V

    .line 211
    return-object v0
.end method
