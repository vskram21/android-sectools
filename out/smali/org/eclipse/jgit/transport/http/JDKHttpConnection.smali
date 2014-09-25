.class public Lorg/eclipse/jgit/transport/http/JDKHttpConnection;
.super Ljava/lang/Object;
.source "JDKHttpConnection.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/http/HttpConnection;


# instance fields
.field wrappedUrlConnection:Ljava/net/HttpURLConnection;


# direct methods
.method protected constructor <init>(Ljava/net/URL;)V
    .locals 1
    .parameter "url"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    invoke-virtual {p1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/http/JDKHttpConnection;->wrappedUrlConnection:Ljava/net/HttpURLConnection;

    .line 83
    return-void
.end method

.method protected constructor <init>(Ljava/net/URL;Ljava/net/Proxy;)V
    .locals 1
    .parameter "url"
    .parameter "proxy"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    invoke-virtual {p1, p2}, Ljava/net/URL;->openConnection(Ljava/net/Proxy;)Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/http/JDKHttpConnection;->wrappedUrlConnection:Ljava/net/HttpURLConnection;

    .line 95
    return-void
.end method


# virtual methods
.method public configure([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V
    .locals 3
    .parameter "km"
    .parameter "tm"
    .parameter "random"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/KeyManagementException;
        }
    .end annotation

    .prologue
    .line 189
    const-string v1, "SSL"

    invoke-static {v1}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v0

    .line 190
    .local v0, ctx:Ljavax/net/ssl/SSLContext;
    invoke-virtual {v0, p1, p2, p3}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 191
    iget-object v1, p0, Lorg/eclipse/jgit/transport/http/JDKHttpConnection;->wrappedUrlConnection:Ljava/net/HttpURLConnection;

    check-cast v1, Ljavax/net/ssl/HttpsURLConnection;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 193
    return-void
.end method

.method public connect()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 178
    iget-object v0, p0, Lorg/eclipse/jgit/transport/http/JDKHttpConnection;->wrappedUrlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->connect()V

    .line 179
    return-void
.end method

.method public getContentLength()I
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lorg/eclipse/jgit/transport/http/JDKHttpConnection;->wrappedUrlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v0

    return v0
.end method

.method public getContentType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 134
    iget-object v0, p0, Lorg/eclipse/jgit/transport/http/JDKHttpConnection;->wrappedUrlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getContentType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHeaderField(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "name"

    .prologue
    .line 142
    iget-object v0, p0, Lorg/eclipse/jgit/transport/http/JDKHttpConnection;->wrappedUrlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHeaderFields()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 110
    iget-object v0, p0, Lorg/eclipse/jgit/transport/http/JDKHttpConnection;->wrappedUrlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 138
    iget-object v0, p0, Lorg/eclipse/jgit/transport/http/JDKHttpConnection;->wrappedUrlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 162
    iget-object v0, p0, Lorg/eclipse/jgit/transport/http/JDKHttpConnection;->wrappedUrlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public getRequestMethod()Ljava/lang/String;
    .locals 1

    .prologue
    .line 170
    iget-object v0, p0, Lorg/eclipse/jgit/transport/http/JDKHttpConnection;->wrappedUrlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getRequestMethod()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getResponseCode()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 98
    iget-object v0, p0, Lorg/eclipse/jgit/transport/http/JDKHttpConnection;->wrappedUrlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    return v0
.end method

.method public getResponseMessage()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 106
    iget-object v0, p0, Lorg/eclipse/jgit/transport/http/JDKHttpConnection;->wrappedUrlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getURL()Ljava/net/URL;
    .locals 1

    .prologue
    .line 102
    iget-object v0, p0, Lorg/eclipse/jgit/transport/http/JDKHttpConnection;->wrappedUrlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object v0

    return-object v0
.end method

.method public setChunkedStreamingMode(I)V
    .locals 1
    .parameter "chunklen"

    .prologue
    .line 166
    iget-object v0, p0, Lorg/eclipse/jgit/transport/http/JDKHttpConnection;->wrappedUrlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setChunkedStreamingMode(I)V

    .line 167
    return-void
.end method

.method public setConnectTimeout(I)V
    .locals 1
    .parameter "timeout"

    .prologue
    .line 126
    iget-object v0, p0, Lorg/eclipse/jgit/transport/http/JDKHttpConnection;->wrappedUrlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 127
    return-void
.end method

.method public setDoOutput(Z)V
    .locals 1
    .parameter "dooutput"

    .prologue
    .line 154
    iget-object v0, p0, Lorg/eclipse/jgit/transport/http/JDKHttpConnection;->wrappedUrlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 155
    return-void
.end method

.method public setFixedLengthStreamingMode(I)V
    .locals 1
    .parameter "contentLength"

    .prologue
    .line 158
    iget-object v0, p0, Lorg/eclipse/jgit/transport/http/JDKHttpConnection;->wrappedUrlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 159
    return-void
.end method

.method public setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V
    .locals 1
    .parameter "hostnameverifier"

    .prologue
    .line 182
    iget-object v0, p0, Lorg/eclipse/jgit/transport/http/JDKHttpConnection;->wrappedUrlConnection:Ljava/net/HttpURLConnection;

    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    invoke-virtual {v0, p1}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 184
    return-void
.end method

.method public setInstanceFollowRedirects(Z)V
    .locals 1
    .parameter "followRedirects"

    .prologue
    .line 150
    iget-object v0, p0, Lorg/eclipse/jgit/transport/http/JDKHttpConnection;->wrappedUrlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 151
    return-void
.end method

.method public setReadTimeout(I)V
    .locals 1
    .parameter "timeout"

    .prologue
    .line 130
    iget-object v0, p0, Lorg/eclipse/jgit/transport/http/JDKHttpConnection;->wrappedUrlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 131
    return-void
.end method

.method public setRequestMethod(Ljava/lang/String;)V
    .locals 1
    .parameter "method"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/ProtocolException;
        }
    .end annotation

    .prologue
    .line 118
    iget-object v0, p0, Lorg/eclipse/jgit/transport/http/JDKHttpConnection;->wrappedUrlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 119
    return-void
.end method

.method public setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "key"
    .parameter "value"

    .prologue
    .line 114
    iget-object v0, p0, Lorg/eclipse/jgit/transport/http/JDKHttpConnection;->wrappedUrlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1, p2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    return-void
.end method

.method public setUseCaches(Z)V
    .locals 1
    .parameter "usecaches"

    .prologue
    .line 122
    iget-object v0, p0, Lorg/eclipse/jgit/transport/http/JDKHttpConnection;->wrappedUrlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 123
    return-void
.end method

.method public usingProxy()Z
    .locals 1

    .prologue
    .line 174
    iget-object v0, p0, Lorg/eclipse/jgit/transport/http/JDKHttpConnection;->wrappedUrlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->usingProxy()Z

    move-result v0

    return v0
.end method
