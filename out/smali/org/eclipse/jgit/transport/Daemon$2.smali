.class Lorg/eclipse/jgit/transport/Daemon$2;
.super Ljava/lang/Object;
.source "Daemon.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/resolver/ReceivePackFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/transport/Daemon;-><init>(Ljava/net/InetSocketAddress;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/eclipse/jgit/transport/resolver/ReceivePackFactory",
        "<",
        "Lorg/eclipse/jgit/transport/DaemonClient;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/transport/Daemon;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/Daemon;)V
    .locals 0
    .parameter

    .prologue
    .line 123
    iput-object p1, p0, Lorg/eclipse/jgit/transport/Daemon$2;->this$0:Lorg/eclipse/jgit/transport/Daemon;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic create(Ljava/lang/Object;Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/transport/ReceivePack;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/transport/resolver/ServiceNotEnabledException;,
            Lorg/eclipse/jgit/transport/resolver/ServiceNotAuthorizedException;
        }
    .end annotation

    .prologue
    .line 123
    check-cast p1, Lorg/eclipse/jgit/transport/DaemonClient;

    .end local p1
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/transport/Daemon$2;->create(Lorg/eclipse/jgit/transport/DaemonClient;Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/transport/ReceivePack;

    move-result-object v0

    return-object v0
.end method

.method public create(Lorg/eclipse/jgit/transport/DaemonClient;Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/transport/ReceivePack;
    .locals 7
    .parameter "req"
    .parameter "db"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/transport/resolver/ServiceNotEnabledException;,
            Lorg/eclipse/jgit/transport/resolver/ServiceNotAuthorizedException;
        }
    .end annotation

    .prologue
    .line 127
    new-instance v4, Lorg/eclipse/jgit/transport/ReceivePack;

    invoke-direct {v4, p2}, Lorg/eclipse/jgit/transport/ReceivePack;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 129
    .local v4, rp:Lorg/eclipse/jgit/transport/ReceivePack;
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/DaemonClient;->getRemoteAddress()Ljava/net/InetAddress;

    move-result-object v3

    .line 130
    .local v3, peer:Ljava/net/InetAddress;
    invoke-virtual {v3}, Ljava/net/InetAddress;->getCanonicalHostName()Ljava/lang/String;

    move-result-object v1

    .line 131
    .local v1, host:Ljava/lang/String;
    if-nez v1, :cond_0

    .line 132
    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v1

    .line 133
    :cond_0
    const-string v2, "anonymous"

    .line 134
    .local v2, name:Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "@"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 135
    .local v0, email:Ljava/lang/String;
    new-instance v5, Lorg/eclipse/jgit/lib/PersonIdent;

    invoke-direct {v5, v2, v0}, Lorg/eclipse/jgit/lib/PersonIdent;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/transport/ReceivePack;->setRefLogIdent(Lorg/eclipse/jgit/lib/PersonIdent;)V

    .line 136
    iget-object v5, p0, Lorg/eclipse/jgit/transport/Daemon$2;->this$0:Lorg/eclipse/jgit/transport/Daemon;

    invoke-virtual {v5}, Lorg/eclipse/jgit/transport/Daemon;->getTimeout()I

    move-result v5

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/transport/ReceivePack;->setTimeout(I)V

    .line 138
    return-object v4
.end method
