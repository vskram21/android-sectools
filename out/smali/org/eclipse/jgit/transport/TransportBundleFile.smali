.class Lorg/eclipse/jgit/transport/TransportBundleFile;
.super Lorg/eclipse/jgit/transport/Transport;
.source "TransportBundleFile.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/TransportBundle;


# static fields
.field static final PROTO_BUNDLE:Lorg/eclipse/jgit/transport/TransportProtocol;


# instance fields
.field private final bundle:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 65
    new-instance v0, Lorg/eclipse/jgit/transport/TransportBundleFile$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/TransportBundleFile$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/transport/TransportBundleFile;->PROTO_BUNDLE:Lorg/eclipse/jgit/transport/TransportProtocol;

    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;Ljava/io/File;)V
    .locals 0
    .parameter "local"
    .parameter "uri"
    .parameter "bundlePath"

    .prologue
    .line 122
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/transport/Transport;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;)V

    .line 123
    iput-object p3, p0, Lorg/eclipse/jgit/transport/TransportBundleFile;->bundle:Ljava/io/File;

    .line 124
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/transport/URIish;Ljava/io/File;)V
    .locals 0
    .parameter "uri"
    .parameter "bundlePath"

    .prologue
    .line 127
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/Transport;-><init>(Lorg/eclipse/jgit/transport/URIish;)V

    .line 128
    iput-object p2, p0, Lorg/eclipse/jgit/transport/TransportBundleFile;->bundle:Ljava/io/File;

    .line 129
    return-void
.end method


# virtual methods
.method public close()V
    .locals 0

    .prologue
    .line 152
    return-void
.end method

.method public openFetch()Lorg/eclipse/jgit/transport/FetchConnection;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;,
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 136
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportBundleFile;->bundle:Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 140
    .local v1, src:Ljava/io/InputStream;
    new-instance v2, Lorg/eclipse/jgit/transport/BundleFetchConnection;

    invoke-direct {v2, p0, v1}, Lorg/eclipse/jgit/transport/BundleFetchConnection;-><init>(Lorg/eclipse/jgit/transport/Transport;Ljava/io/InputStream;)V

    return-object v2

    .line 137
    .end local v1           #src:Ljava/io/InputStream;
    :catch_0
    move-exception v0

    .line 138
    .local v0, err:Ljava/io/FileNotFoundException;
    new-instance v2, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/TransportBundleFile;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->notFound:Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v2
.end method

.method public openPush()Lorg/eclipse/jgit/transport/PushConnection;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;
        }
    .end annotation

    .prologue
    .line 145
    new-instance v0, Lorg/eclipse/jgit/errors/NotSupportedException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->pushIsNotSupportedForBundleTransport:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/NotSupportedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
