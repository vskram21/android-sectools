.class public Lorg/eclipse/jgit/transport/TransportBundleStream;
.super Lorg/eclipse/jgit/transport/Transport;
.source "TransportBundleStream.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/TransportBundle;


# instance fields
.field private src:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;Ljava/io/InputStream;)V
    .locals 0
    .parameter "db"
    .parameter "uri"
    .parameter "in"

    .prologue
    .line 89
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/transport/Transport;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;)V

    .line 90
    iput-object p3, p0, Lorg/eclipse/jgit/transport/TransportBundleStream;->src:Ljava/io/InputStream;

    .line 91
    return-void
.end method


# virtual methods
.method public close()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 112
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportBundleStream;->src:Ljava/io/InputStream;

    if-eqz v0, :cond_0

    .line 114
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportBundleStream;->src:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 118
    iput-object v1, p0, Lorg/eclipse/jgit/transport/TransportBundleStream;->src:Ljava/io/InputStream;

    .line 121
    :cond_0
    :goto_0
    return-void

    .line 115
    :catch_0
    move-exception v0

    .line 118
    iput-object v1, p0, Lorg/eclipse/jgit/transport/TransportBundleStream;->src:Ljava/io/InputStream;

    goto :goto_0

    :catchall_0
    move-exception v0

    iput-object v1, p0, Lorg/eclipse/jgit/transport/TransportBundleStream;->src:Ljava/io/InputStream;

    throw v0
.end method

.method public openFetch()Lorg/eclipse/jgit/transport/FetchConnection;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 95
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportBundleStream;->src:Ljava/io/InputStream;

    if-nez v0, :cond_0

    .line 96
    new-instance v0, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportBundleStream;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->onlyOneFetchSupported:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v0

    .line 98
    :cond_0
    :try_start_0
    new-instance v0, Lorg/eclipse/jgit/transport/BundleFetchConnection;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportBundleStream;->src:Ljava/io/InputStream;

    invoke-direct {v0, p0, v1}, Lorg/eclipse/jgit/transport/BundleFetchConnection;-><init>(Lorg/eclipse/jgit/transport/Transport;Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 100
    iput-object v2, p0, Lorg/eclipse/jgit/transport/TransportBundleStream;->src:Ljava/io/InputStream;

    return-object v0

    :catchall_0
    move-exception v0

    iput-object v2, p0, Lorg/eclipse/jgit/transport/TransportBundleStream;->src:Ljava/io/InputStream;

    throw v0
.end method

.method public openPush()Lorg/eclipse/jgit/transport/PushConnection;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;
        }
    .end annotation

    .prologue
    .line 106
    new-instance v0, Lorg/eclipse/jgit/errors/NotSupportedException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->pushIsNotSupportedForBundleTransport:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/NotSupportedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
