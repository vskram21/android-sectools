.class Lorg/eclipse/jgit/transport/DefaultSshSessionFactory;
.super Lorg/eclipse/jgit/transport/JschConfigSessionFactory;
.source "DefaultSshSessionFactory.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 61
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;-><init>()V

    return-void
.end method


# virtual methods
.method protected configure(Lorg/eclipse/jgit/transport/OpenSshConfig$Host;Lcom/jcraft/jsch/Session;)V
    .locals 0
    .parameter "hc"
    .parameter "session"

    .prologue
    .line 64
    return-void
.end method
