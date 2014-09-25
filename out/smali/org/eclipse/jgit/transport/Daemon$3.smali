.class Lorg/eclipse/jgit/transport/Daemon$3;
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
    .line 143
    iput-object p1, p0, Lorg/eclipse/jgit/transport/Daemon$3;->this$0:Lorg/eclipse/jgit/transport/Daemon;

    invoke-direct {p0, p2, p3}, Lorg/eclipse/jgit/transport/DaemonService;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/Daemon$3;->setEnabled(Z)V

    .line 146
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
    .line 153
    iget-object v3, p0, Lorg/eclipse/jgit/transport/Daemon$3;->this$0:Lorg/eclipse/jgit/transport/Daemon;

    #getter for: Lorg/eclipse/jgit/transport/Daemon;->uploadPackFactory:Lorg/eclipse/jgit/transport/resolver/UploadPackFactory;
    invoke-static {v3}, Lorg/eclipse/jgit/transport/Daemon;->access$000(Lorg/eclipse/jgit/transport/Daemon;)Lorg/eclipse/jgit/transport/resolver/UploadPackFactory;

    move-result-object v3

    invoke-interface {v3, p1, p2}, Lorg/eclipse/jgit/transport/resolver/UploadPackFactory;->create(Ljava/lang/Object;Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/transport/UploadPack;

    move-result-object v2

    .line 154
    .local v2, up:Lorg/eclipse/jgit/transport/UploadPack;
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/DaemonClient;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 155
    .local v0, in:Ljava/io/InputStream;
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/DaemonClient;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    .line 156
    .local v1, out:Ljava/io/OutputStream;
    const/4 v3, 0x0

    invoke-virtual {v2, v0, v1, v3}, Lorg/eclipse/jgit/transport/UploadPack;->upload(Ljava/io/InputStream;Ljava/io/OutputStream;Ljava/io/OutputStream;)V

    .line 157
    return-void
.end method
