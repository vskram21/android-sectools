.class Lorg/eclipse/jgit/transport/TransportHttp$SmartHttpPushConnection;
.super Lorg/eclipse/jgit/transport/BasePackPushConnection;
.source "TransportHttp.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/TransportHttp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SmartHttpPushConnection"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/transport/TransportHttp;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/TransportHttp;Ljava/io/InputStream;)V
    .locals 1
    .parameter
    .parameter "advertisement"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 794
    iput-object p1, p0, Lorg/eclipse/jgit/transport/TransportHttp$SmartHttpPushConnection;->this$0:Lorg/eclipse/jgit/transport/TransportHttp;

    .line 795
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/BasePackPushConnection;-><init>(Lorg/eclipse/jgit/transport/PackTransport;)V

    .line 796
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$SmartHttpPushConnection;->statelessRPC:Z

    .line 798
    sget-object v0, Lorg/eclipse/jgit/util/io/DisabledOutputStream;->INSTANCE:Lorg/eclipse/jgit/util/io/DisabledOutputStream;

    invoke-virtual {p0, p2, v0}, Lorg/eclipse/jgit/transport/TransportHttp$SmartHttpPushConnection;->init(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 799
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$SmartHttpPushConnection;->outNeedsEnd:Z

    .line 800
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportHttp$SmartHttpPushConnection;->readAdvertisedRefs()V

    .line 801
    return-void
.end method


# virtual methods
.method protected doPush(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Map;Ljava/io/OutputStream;)V
    .locals 3
    .parameter "monitor"
    .parameter
    .parameter "outputStream"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/transport/RemoteRefUpdate;",
            ">;",
            "Ljava/io/OutputStream;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 806
    .local p2, refUpdates:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/transport/RemoteRefUpdate;>;"
    new-instance v0, Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportHttp$SmartHttpPushConnection;->this$0:Lorg/eclipse/jgit/transport/TransportHttp;

    const-string v2, "git-receive-pack"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;-><init>(Lorg/eclipse/jgit/transport/TransportHttp;Ljava/lang/String;)V

    .line 807
    .local v0, svc:Lorg/eclipse/jgit/transport/TransportHttp$Service;
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/TransportHttp$Service;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/TransportHttp$Service;->getOutputStream()Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpOutputStream;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lorg/eclipse/jgit/transport/TransportHttp$SmartHttpPushConnection;->init(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 808
    invoke-super {p0, p1, p2, p3}, Lorg/eclipse/jgit/transport/BasePackPushConnection;->doPush(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Map;Ljava/io/OutputStream;)V

    .line 809
    return-void
.end method
