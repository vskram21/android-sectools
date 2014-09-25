.class Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpOutputStream;
.super Lorg/eclipse/jgit/util/TemporaryBuffer;
.source "TransportHttp.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/TransportHttp$Service;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "HttpOutputStream"
.end annotation


# instance fields
.field final synthetic this$1:Lorg/eclipse/jgit/transport/TransportHttp$Service;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/TransportHttp$Service;)V
    .locals 1
    .parameter

    .prologue
    .line 915
    iput-object p1, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpOutputStream;->this$1:Lorg/eclipse/jgit/transport/TransportHttp$Service;

    .line 916
    iget-object v0, p1, Lorg/eclipse/jgit/transport/TransportHttp$Service;->this$0:Lorg/eclipse/jgit/transport/TransportHttp;

    #getter for: Lorg/eclipse/jgit/transport/TransportHttp;->http:Lorg/eclipse/jgit/transport/TransportHttp$HttpConfig;
    invoke-static {v0}, Lorg/eclipse/jgit/transport/TransportHttp;->access$400(Lorg/eclipse/jgit/transport/TransportHttp;)Lorg/eclipse/jgit/transport/TransportHttp$HttpConfig;

    move-result-object v0

    iget v0, v0, Lorg/eclipse/jgit/transport/TransportHttp$HttpConfig;->postBuffer:I

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/util/TemporaryBuffer;-><init>(I)V

    .line 917
    return-void
.end method


# virtual methods
.method protected overflow()Ljava/io/OutputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 921
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpOutputStream;->this$1:Lorg/eclipse/jgit/transport/TransportHttp$Service;

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/TransportHttp$Service;->openStream()V

    .line 922
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpOutputStream;->this$1:Lorg/eclipse/jgit/transport/TransportHttp$Service;

    iget-object v0, v0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->conn:Lorg/eclipse/jgit/transport/http/HttpConnection;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lorg/eclipse/jgit/transport/http/HttpConnection;->setChunkedStreamingMode(I)V

    .line 923
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpOutputStream;->this$1:Lorg/eclipse/jgit/transport/TransportHttp$Service;

    iget-object v0, v0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->conn:Lorg/eclipse/jgit/transport/http/HttpConnection;

    invoke-interface {v0}, Lorg/eclipse/jgit/transport/http/HttpConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method
