.class Lorg/eclipse/jgit/transport/TransportHttp$LongPollService;
.super Lorg/eclipse/jgit/transport/TransportHttp$Service;
.source "TransportHttp.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/TransportHttp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LongPollService"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/transport/TransportHttp;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/TransportHttp;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter "serviceName"

    .prologue
    .line 992
    iput-object p1, p0, Lorg/eclipse/jgit/transport/TransportHttp$LongPollService;->this$0:Lorg/eclipse/jgit/transport/TransportHttp;

    .line 993
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/transport/TransportHttp$Service;-><init>(Lorg/eclipse/jgit/transport/TransportHttp;Ljava/lang/String;)V

    .line 994
    return-void
.end method


# virtual methods
.method execute()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 999
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$LongPollService;->out:Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpOutputStream;

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpOutputStream;->close()V

    .line 1000
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$LongPollService;->conn:Lorg/eclipse/jgit/transport/http/HttpConnection;

    if-nez v0, :cond_0

    .line 1001
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportHttp$LongPollService;->sendRequest()V

    .line 1002
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportHttp$LongPollService;->openResponse()V

    .line 1003
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$LongPollService;->in:Lorg/eclipse/jgit/util/io/UnionInputStream;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportHttp$LongPollService;->this$0:Lorg/eclipse/jgit/transport/TransportHttp;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportHttp$LongPollService;->conn:Lorg/eclipse/jgit/transport/http/HttpConnection;

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/transport/TransportHttp;->openInputStream(Lorg/eclipse/jgit/transport/http/HttpConnection;)Ljava/io/InputStream;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/util/io/UnionInputStream;->add(Ljava/io/InputStream;)V

    .line 1004
    return-void
.end method
