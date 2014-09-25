.class Lorg/eclipse/jgit/transport/Daemon$4;
.super Lorg/eclipse/jgit/transport/DaemonService;
.source "Daemon.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/transport/Daemon;-><init>(Ljava/net/InetSocketAddress;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/transport/Daemon;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/Daemon;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 158
    iput-object p1, p0, Lorg/eclipse/jgit/transport/Daemon$4;->this$0:Lorg/eclipse/jgit/transport/Daemon;

    invoke-direct {p0, p2, p3}, Lorg/eclipse/jgit/transport/DaemonService;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/Daemon$4;->setEnabled(Z)V

    .line 161
    return-void
.end method


# virtual methods
.method protected execute(Lorg/eclipse/jgit/transport/DaemonClient;Lorg/eclipse/jgit/lib/Repository;)V
    .locals 4
    .parameter "dc"
    .parameter "db"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/transport/resolver/ServiceNotEnabledException;,
            Lorg/eclipse/jgit/transport/resolver/ServiceNotAuthorizedException;
        }
    .end annotation

    .prologue
    .line 168
    iget-object v3, p0, Lorg/eclipse/jgit/transport/Daemon$4;->this$0:Lorg/eclipse/jgit/transport/Daemon;

    #getter for: Lorg/eclipse/jgit/transport/Daemon;->receivePackFactory:Lorg/eclipse/jgit/transport/resolver/ReceivePackFactory;
    invoke-static {v3}, Lorg/eclipse/jgit/transport/Daemon;->access$100(Lorg/eclipse/jgit/transport/Daemon;)Lorg/eclipse/jgit/transport/resolver/ReceivePackFactory;

    move-result-object v3

    invoke-interface {v3, p1, p2}, Lorg/eclipse/jgit/transport/resolver/ReceivePackFactory;->create(Ljava/lang/Object;Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/transport/ReceivePack;

    move-result-object v2

    .line 169
    .local v2, rp:Lorg/eclipse/jgit/transport/ReceivePack;
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/DaemonClient;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 170
    .local v0, in:Ljava/io/InputStream;
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/DaemonClient;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    .line 171
    .local v1, out:Ljava/io/OutputStream;
    const/4 v3, 0x0

    invoke-virtual {v2, v0, v1, v3}, Lorg/eclipse/jgit/transport/ReceivePack;->receive(Ljava/io/InputStream;Ljava/io/OutputStream;Ljava/io/OutputStream;)V

    .line 172
    return-void
.end method
