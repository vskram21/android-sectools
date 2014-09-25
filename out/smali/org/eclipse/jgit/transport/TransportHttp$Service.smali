.class abstract Lorg/eclipse/jgit/transport/TransportHttp$Service;
.super Ljava/lang/Object;
.source "TransportHttp.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/TransportHttp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x400
    name = "Service"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpExecuteStream;,
        Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpOutputStream;
    }
.end annotation


# instance fields
.field protected conn:Lorg/eclipse/jgit/transport/http/HttpConnection;

.field protected final execute:Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpExecuteStream;

.field final in:Lorg/eclipse/jgit/util/io/UnionInputStream;

.field protected out:Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpOutputStream;

.field protected final requestType:Ljava/lang/String;

.field protected final responseType:Ljava/lang/String;

.field protected final serviceName:Ljava/lang/String;

.field final synthetic this$0:Lorg/eclipse/jgit/transport/TransportHttp;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/TransportHttp;Ljava/lang/String;)V
    .locals 4
    .parameter
    .parameter "serviceName"

    .prologue
    .line 828
    iput-object p1, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->this$0:Lorg/eclipse/jgit/transport/TransportHttp;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 829
    iput-object p2, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->serviceName:Ljava/lang/String;

    .line 830
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "application/x-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "-request"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->requestType:Ljava/lang/String;

    .line 831
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "application/x-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "-result"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->responseType:Ljava/lang/String;

    .line 833
    new-instance v0, Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpOutputStream;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpOutputStream;-><init>(Lorg/eclipse/jgit/transport/TransportHttp$Service;)V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->out:Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpOutputStream;

    .line 834
    new-instance v0, Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpExecuteStream;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpExecuteStream;-><init>(Lorg/eclipse/jgit/transport/TransportHttp$Service;)V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->execute:Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpExecuteStream;

    .line 835
    new-instance v0, Lorg/eclipse/jgit/util/io/UnionInputStream;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/io/InputStream;

    const/4 v2, 0x0

    iget-object v3, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->execute:Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpExecuteStream;

    aput-object v3, v1, v2

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/util/io/UnionInputStream;-><init>([Ljava/io/InputStream;)V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->in:Lorg/eclipse/jgit/util/io/UnionInputStream;

    .line 836
    return-void
.end method


# virtual methods
.method abstract execute()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method getInputStream()Ljava/io/InputStream;
    .locals 1

    .prologue
    .line 892
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->in:Lorg/eclipse/jgit/util/io/UnionInputStream;

    return-object v0
.end method

.method getOutputStream()Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpOutputStream;
    .locals 1

    .prologue
    .line 888
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->out:Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpOutputStream;

    return-object v0
.end method

.method openResponse()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 874
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->conn:Lorg/eclipse/jgit/transport/http/HttpConnection;

    invoke-static {v2}, Lorg/eclipse/jgit/util/HttpSupport;->response(Lorg/eclipse/jgit/transport/http/HttpConnection;)I

    move-result v1

    .line 875
    .local v1, status:I
    const/16 v2, 0xc8

    if-eq v1, v2, :cond_0

    .line 876
    new-instance v2, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->this$0:Lorg/eclipse/jgit/transport/TransportHttp;

    iget-object v3, v3, Lorg/eclipse/jgit/transport/TransportHttp;->uri:Lorg/eclipse/jgit/transport/URIish;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->conn:Lorg/eclipse/jgit/transport/http/HttpConnection;

    invoke-interface {v5}, Lorg/eclipse/jgit/transport/http/HttpConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v2

    .line 880
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->conn:Lorg/eclipse/jgit/transport/http/HttpConnection;

    invoke-interface {v2}, Lorg/eclipse/jgit/transport/http/HttpConnection;->getContentType()Ljava/lang/String;

    move-result-object v0

    .line 881
    .local v0, contentType:Ljava/lang/String;
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->responseType:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 882
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->conn:Lorg/eclipse/jgit/transport/http/HttpConnection;

    invoke-interface {v2}, Lorg/eclipse/jgit/transport/http/HttpConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 883
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->this$0:Lorg/eclipse/jgit/transport/TransportHttp;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->responseType:Ljava/lang/String;

    invoke-virtual {v2, v3, v0}, Lorg/eclipse/jgit/transport/TransportHttp;->wrongContentType(Ljava/lang/String;Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 885
    :cond_1
    return-void
.end method

.method openStream()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 839
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->this$0:Lorg/eclipse/jgit/transport/TransportHttp;

    const-string v1, "POST"

    new-instance v2, Ljava/net/URL;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->this$0:Lorg/eclipse/jgit/transport/TransportHttp;

    #getter for: Lorg/eclipse/jgit/transport/TransportHttp;->baseUrl:Ljava/net/URL;
    invoke-static {v3}, Lorg/eclipse/jgit/transport/TransportHttp;->access$300(Lorg/eclipse/jgit/transport/TransportHttp;)Ljava/net/URL;

    move-result-object v3

    iget-object v4, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->serviceName:Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/transport/TransportHttp;->httpOpen(Ljava/lang/String;Ljava/net/URL;)Lorg/eclipse/jgit/transport/http/HttpConnection;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->conn:Lorg/eclipse/jgit/transport/http/HttpConnection;

    .line 840
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->conn:Lorg/eclipse/jgit/transport/http/HttpConnection;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lorg/eclipse/jgit/transport/http/HttpConnection;->setInstanceFollowRedirects(Z)V

    .line 841
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->conn:Lorg/eclipse/jgit/transport/http/HttpConnection;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lorg/eclipse/jgit/transport/http/HttpConnection;->setDoOutput(Z)V

    .line 842
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->conn:Lorg/eclipse/jgit/transport/http/HttpConnection;

    const-string v1, "Content-Type"

    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->requestType:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lorg/eclipse/jgit/transport/http/HttpConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 843
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->conn:Lorg/eclipse/jgit/transport/http/HttpConnection;

    const-string v1, "Accept"

    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->responseType:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lorg/eclipse/jgit/transport/http/HttpConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 844
    return-void
.end method

.method sendRequest()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 848
    new-instance v0, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->this$0:Lorg/eclipse/jgit/transport/TransportHttp;

    #getter for: Lorg/eclipse/jgit/transport/TransportHttp;->http:Lorg/eclipse/jgit/transport/TransportHttp$HttpConfig;
    invoke-static {v4}, Lorg/eclipse/jgit/transport/TransportHttp;->access$400(Lorg/eclipse/jgit/transport/TransportHttp;)Lorg/eclipse/jgit/transport/TransportHttp$HttpConfig;

    move-result-object v4

    iget v4, v4, Lorg/eclipse/jgit/transport/TransportHttp$HttpConfig;->postBuffer:I

    invoke-direct {v0, v4}, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;-><init>(I)V

    .line 850
    .local v0, buf:Lorg/eclipse/jgit/util/TemporaryBuffer;
    :try_start_0
    new-instance v2, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v2, v0}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 851
    .local v2, gzip:Ljava/util/zip/GZIPOutputStream;
    iget-object v4, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->out:Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpOutputStream;

    const/4 v5, 0x0

    invoke-virtual {v4, v2, v5}, Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpOutputStream;->writeTo(Ljava/io/OutputStream;Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 852
    invoke-virtual {v2}, Ljava/util/zip/GZIPOutputStream;->close()V

    .line 853
    iget-object v4, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->out:Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpOutputStream;

    invoke-virtual {v4}, Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpOutputStream;->length()J

    move-result-wide v4

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/TemporaryBuffer;->length()J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-gez v4, :cond_0

    .line 854
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->out:Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpOutputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 861
    .end local v2           #gzip:Ljava/util/zip/GZIPOutputStream;
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportHttp$Service;->openStream()V

    .line 862
    iget-object v4, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->out:Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpOutputStream;

    if-eq v0, v4, :cond_1

    .line 863
    iget-object v4, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->conn:Lorg/eclipse/jgit/transport/http/HttpConnection;

    const-string v5, "Content-Encoding"

    const-string v6, "gzip"

    invoke-interface {v4, v5, v6}, Lorg/eclipse/jgit/transport/http/HttpConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 864
    :cond_1
    iget-object v4, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->conn:Lorg/eclipse/jgit/transport/http/HttpConnection;

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/TemporaryBuffer;->length()J

    move-result-wide v5

    long-to-int v5, v5

    invoke-interface {v4, v5}, Lorg/eclipse/jgit/transport/http/HttpConnection;->setFixedLengthStreamingMode(I)V

    .line 865
    iget-object v4, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->conn:Lorg/eclipse/jgit/transport/http/HttpConnection;

    invoke-interface {v4}, Lorg/eclipse/jgit/transport/http/HttpConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    .line 867
    .local v3, httpOut:Ljava/io/OutputStream;
    const/4 v4, 0x0

    :try_start_1
    invoke-virtual {v0, v3, v4}, Lorg/eclipse/jgit/util/TemporaryBuffer;->writeTo(Ljava/io/OutputStream;Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 869
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 871
    return-void

    .line 855
    .end local v3           #httpOut:Ljava/io/OutputStream;
    :catch_0
    move-exception v1

    .line 858
    .local v1, err:Ljava/io/IOException;
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service;->out:Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpOutputStream;

    goto :goto_0

    .line 869
    .end local v1           #err:Ljava/io/IOException;
    .restart local v3       #httpOut:Ljava/io/OutputStream;
    :catchall_0
    move-exception v4

    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    throw v4
.end method
