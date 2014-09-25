.class Lorg/eclipse/jgit/transport/Daemon$1;
.super Ljava/lang/Object;
.source "Daemon.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/resolver/UploadPackFactory;


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
        "Lorg/eclipse/jgit/transport/resolver/UploadPackFactory",
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
    .line 112
    iput-object p1, p0, Lorg/eclipse/jgit/transport/Daemon$1;->this$0:Lorg/eclipse/jgit/transport/Daemon;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic create(Ljava/lang/Object;Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/transport/UploadPack;
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
    .line 112
    check-cast p1, Lorg/eclipse/jgit/transport/DaemonClient;

    .end local p1
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/transport/Daemon$1;->create(Lorg/eclipse/jgit/transport/DaemonClient;Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/transport/UploadPack;

    move-result-object v0

    return-object v0
.end method

.method public create(Lorg/eclipse/jgit/transport/DaemonClient;Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/transport/UploadPack;
    .locals 2
    .parameter "req"
    .parameter "db"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/transport/resolver/ServiceNotEnabledException;,
            Lorg/eclipse/jgit/transport/resolver/ServiceNotAuthorizedException;
        }
    .end annotation

    .prologue
    .line 116
    new-instance v0, Lorg/eclipse/jgit/transport/UploadPack;

    invoke-direct {v0, p2}, Lorg/eclipse/jgit/transport/UploadPack;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 117
    .local v0, up:Lorg/eclipse/jgit/transport/UploadPack;
    iget-object v1, p0, Lorg/eclipse/jgit/transport/Daemon$1;->this$0:Lorg/eclipse/jgit/transport/Daemon;

    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/Daemon;->getTimeout()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/transport/UploadPack;->setTimeout(I)V

    .line 118
    iget-object v1, p0, Lorg/eclipse/jgit/transport/Daemon$1;->this$0:Lorg/eclipse/jgit/transport/Daemon;

    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/Daemon;->getPackConfig()Lorg/eclipse/jgit/storage/pack/PackConfig;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/transport/UploadPack;->setPackConfig(Lorg/eclipse/jgit/storage/pack/PackConfig;)V

    .line 119
    return-object v0
.end method
