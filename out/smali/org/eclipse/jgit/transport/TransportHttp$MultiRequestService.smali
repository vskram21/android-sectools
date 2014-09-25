.class Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;
.super Lorg/eclipse/jgit/transport/TransportHttp$Service;
.source "TransportHttp.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/TransportHttp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MultiRequestService"
.end annotation


# instance fields
.field finalRequest:Z

.field final synthetic this$0:Lorg/eclipse/jgit/transport/TransportHttp;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/TransportHttp;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter "serviceName"

    .prologue
    .line 951
    iput-object p1, p0, Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;->this$0:Lorg/eclipse/jgit/transport/TransportHttp;

    .line 952
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/transport/TransportHttp$Service;-><init>(Lorg/eclipse/jgit/transport/TransportHttp;Ljava/lang/String;)V

    .line 953
    return-void
.end method


# virtual methods
.method execute()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 958
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;->out:Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpOutputStream;

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpOutputStream;->close()V

    .line 960
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;->conn:Lorg/eclipse/jgit/transport/http/HttpConnection;

    if-nez v0, :cond_2

    .line 961
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;->out:Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpOutputStream;

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpOutputStream;->length()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    .line 967
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;->finalRequest:Z

    if-eqz v0, :cond_0

    .line 984
    :goto_0
    return-void

    .line 969
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;->this$0:Lorg/eclipse/jgit/transport/TransportHttp;

    iget-object v1, v1, Lorg/eclipse/jgit/transport/TransportHttp;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->startingReadStageWithoutWrittenRequestDataPendingIsNotSupported:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v0

    .line 973
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;->sendRequest()V

    .line 976
    :cond_2
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;->out:Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpOutputStream;

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpOutputStream;->reset()V

    .line 978
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;->openResponse()V

    .line 980
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;->in:Lorg/eclipse/jgit/util/io/UnionInputStream;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;->this$0:Lorg/eclipse/jgit/transport/TransportHttp;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;->conn:Lorg/eclipse/jgit/transport/http/HttpConnection;

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/transport/TransportHttp;->openInputStream(Lorg/eclipse/jgit/transport/http/HttpConnection;)Ljava/io/InputStream;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/util/io/UnionInputStream;->add(Ljava/io/InputStream;)V

    .line 981
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;->finalRequest:Z

    if-nez v0, :cond_3

    .line 982
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;->in:Lorg/eclipse/jgit/util/io/UnionInputStream;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;->execute:Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpExecuteStream;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/util/io/UnionInputStream;->add(Ljava/io/InputStream;)V

    .line 983
    :cond_3
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;->conn:Lorg/eclipse/jgit/transport/http/HttpConnection;

    goto :goto_0
.end method
