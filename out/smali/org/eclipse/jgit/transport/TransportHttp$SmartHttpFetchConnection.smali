.class Lorg/eclipse/jgit/transport/TransportHttp$SmartHttpFetchConnection;
.super Lorg/eclipse/jgit/transport/BasePackFetchConnection;
.source "TransportHttp.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/TransportHttp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SmartHttpFetchConnection"
.end annotation


# instance fields
.field private svc:Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;

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
    .line 764
    iput-object p1, p0, Lorg/eclipse/jgit/transport/TransportHttp$SmartHttpFetchConnection;->this$0:Lorg/eclipse/jgit/transport/TransportHttp;

    .line 765
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;-><init>(Lorg/eclipse/jgit/transport/PackTransport;)V

    .line 766
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$SmartHttpFetchConnection;->statelessRPC:Z

    .line 768
    sget-object v0, Lorg/eclipse/jgit/util/io/DisabledOutputStream;->INSTANCE:Lorg/eclipse/jgit/util/io/DisabledOutputStream;

    invoke-virtual {p0, p2, v0}, Lorg/eclipse/jgit/transport/TransportHttp$SmartHttpFetchConnection;->init(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 769
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$SmartHttpFetchConnection;->outNeedsEnd:Z

    .line 770
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportHttp$SmartHttpFetchConnection;->readAdvertisedRefs()V

    .line 771
    return-void
.end method


# virtual methods
.method protected doFetch(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Collection;Ljava/util/Set;Ljava/io/OutputStream;)V
    .locals 4
    .parameter "monitor"
    .parameter
    .parameter
    .parameter "outputStream"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
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
    .local p2, want:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    .local p3, have:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    const/4 v3, 0x0

    .line 778
    :try_start_0
    new-instance v0, Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportHttp$SmartHttpFetchConnection;->this$0:Lorg/eclipse/jgit/transport/TransportHttp;

    const-string v2, "git-upload-pack"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;-><init>(Lorg/eclipse/jgit/transport/TransportHttp;Ljava/lang/String;)V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$SmartHttpFetchConnection;->svc:Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;

    .line 779
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$SmartHttpFetchConnection;->svc:Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportHttp$SmartHttpFetchConnection;->svc:Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;

    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;->getOutputStream()Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpOutputStream;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/transport/TransportHttp$SmartHttpFetchConnection;->init(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 780
    invoke-super {p0, p1, p2, p3, p4}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->doFetch(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Collection;Ljava/util/Set;Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 782
    iput-object v3, p0, Lorg/eclipse/jgit/transport/TransportHttp$SmartHttpFetchConnection;->svc:Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;

    .line 784
    return-void

    .line 782
    :catchall_0
    move-exception v0

    iput-object v3, p0, Lorg/eclipse/jgit/transport/TransportHttp$SmartHttpFetchConnection;->svc:Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;

    throw v0
.end method

.method protected onReceivePack()V
    .locals 2

    .prologue
    .line 788
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$SmartHttpFetchConnection;->svc:Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;->finalRequest:Z

    .line 789
    return-void
.end method
