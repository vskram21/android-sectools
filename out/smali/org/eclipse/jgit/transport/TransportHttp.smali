.class public Lorg/eclipse/jgit/transport/TransportHttp;
.super Lorg/eclipse/jgit/transport/HttpTransport;
.source "TransportHttp.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/WalkTransport;
.implements Lorg/eclipse/jgit/transport/PackTransport;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/transport/TransportHttp$DummyHostnameVerifier;,
        Lorg/eclipse/jgit/transport/TransportHttp$DummyX509TrustManager;,
        Lorg/eclipse/jgit/transport/TransportHttp$HttpConfig;,
        Lorg/eclipse/jgit/transport/TransportHttp$HttpObjectDB;,
        Lorg/eclipse/jgit/transport/TransportHttp$LongPollService;,
        Lorg/eclipse/jgit/transport/TransportHttp$MultiRequestService;,
        Lorg/eclipse/jgit/transport/TransportHttp$Service;,
        Lorg/eclipse/jgit/transport/TransportHttp$SmartHttpFetchConnection;,
        Lorg/eclipse/jgit/transport/TransportHttp$SmartHttpPushConnection;
    }
.end annotation


# static fields
.field private static final HTTP_KEY:Lorg/eclipse/jgit/lib/Config$SectionParser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/lib/Config$SectionParser",
            "<",
            "Lorg/eclipse/jgit/transport/TransportHttp$HttpConfig;",
            ">;"
        }
    .end annotation
.end field

.field static final PROTO_FTP:Lorg/eclipse/jgit/transport/TransportProtocol; = null

.field static final PROTO_HTTP:Lorg/eclipse/jgit/transport/TransportProtocol; = null

.field private static final SVC_RECEIVE_PACK:Ljava/lang/String; = "git-receive-pack"

.field private static final SVC_UPLOAD_PACK:Ljava/lang/String; = "git-upload-pack"

.field private static final userAgent:Ljava/lang/String;


# instance fields
.field private authMethod:Lorg/eclipse/jgit/transport/HttpAuthMethod;

.field private final baseUrl:Ljava/net/URL;

.field private headers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final http:Lorg/eclipse/jgit/transport/TransportHttp$HttpConfig;

.field private final objectsUrl:Ljava/net/URL;

.field private final proxySelector:Ljava/net/ProxySelector;

.field private useSmartHttp:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 137
    invoke-static {}, Lorg/eclipse/jgit/transport/TransportHttp;->computeUserAgent()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/transport/TransportHttp;->userAgent:Ljava/lang/String;

    .line 139
    new-instance v0, Lorg/eclipse/jgit/transport/TransportHttp$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/TransportHttp$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/transport/TransportHttp;->PROTO_HTTP:Lorg/eclipse/jgit/transport/TransportProtocol;

    .line 178
    new-instance v0, Lorg/eclipse/jgit/transport/TransportHttp$2;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/TransportHttp$2;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/transport/TransportHttp;->PROTO_FTP:Lorg/eclipse/jgit/transport/TransportProtocol;

    .line 218
    new-instance v0, Lorg/eclipse/jgit/transport/TransportHttp$3;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/TransportHttp$3;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/transport/TransportHttp;->HTTP_KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;

    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;)V
    .locals 6
    .parameter "local"
    .parameter "uri"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 255
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/transport/HttpTransport;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;)V

    .line 247
    iput-boolean v5, p0, Lorg/eclipse/jgit/transport/TransportHttp;->useSmartHttp:Z

    .line 249
    sget-object v2, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;->NONE:Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;->method(Ljava/lang/String;)Lorg/eclipse/jgit/transport/HttpAuthMethod;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/transport/TransportHttp;->authMethod:Lorg/eclipse/jgit/transport/HttpAuthMethod;

    .line 257
    :try_start_0
    invoke-virtual {p2}, Lorg/eclipse/jgit/transport/URIish;->toString()Ljava/lang/String;

    move-result-object v1

    .line 258
    .local v1, uriString:Ljava/lang/String;
    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 259
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 260
    :cond_0
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lorg/eclipse/jgit/transport/TransportHttp;->baseUrl:Ljava/net/URL;

    .line 261
    new-instance v2, Ljava/net/URL;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/TransportHttp;->baseUrl:Ljava/net/URL;

    const-string v4, "objects/"

    invoke-direct {v2, v3, v4}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    iput-object v2, p0, Lorg/eclipse/jgit/transport/TransportHttp;->objectsUrl:Ljava/net/URL;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 265
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v2

    sget-object v3, Lorg/eclipse/jgit/transport/TransportHttp;->HTTP_KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/lib/StoredConfig;->get(Lorg/eclipse/jgit/lib/Config$SectionParser;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/transport/TransportHttp$HttpConfig;

    iput-object v2, p0, Lorg/eclipse/jgit/transport/TransportHttp;->http:Lorg/eclipse/jgit/transport/TransportHttp$HttpConfig;

    .line 266
    invoke-static {}, Ljava/net/ProxySelector;->getDefault()Ljava/net/ProxySelector;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/transport/TransportHttp;->proxySelector:Ljava/net/ProxySelector;

    .line 267
    return-void

    .line 262
    .end local v1           #uriString:Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 263
    .local v0, e:Ljava/net/MalformedURLException;
    new-instance v2, Lorg/eclipse/jgit/errors/NotSupportedException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->invalidURL:Ljava/lang/String;

    new-array v4, v5, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p2, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lorg/eclipse/jgit/errors/NotSupportedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method constructor <init>(Lorg/eclipse/jgit/transport/URIish;)V
    .locals 7
    .parameter "uri"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 276
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/HttpTransport;-><init>(Lorg/eclipse/jgit/transport/URIish;)V

    .line 247
    iput-boolean v5, p0, Lorg/eclipse/jgit/transport/TransportHttp;->useSmartHttp:Z

    .line 249
    sget-object v2, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;->NONE:Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

    invoke-virtual {v2, v6}, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;->method(Ljava/lang/String;)Lorg/eclipse/jgit/transport/HttpAuthMethod;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/transport/TransportHttp;->authMethod:Lorg/eclipse/jgit/transport/HttpAuthMethod;

    .line 278
    :try_start_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->toString()Ljava/lang/String;

    move-result-object v1

    .line 279
    .local v1, uriString:Ljava/lang/String;
    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 280
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 281
    :cond_0
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lorg/eclipse/jgit/transport/TransportHttp;->baseUrl:Ljava/net/URL;

    .line 282
    new-instance v2, Ljava/net/URL;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/TransportHttp;->baseUrl:Ljava/net/URL;

    const-string v4, "objects/"

    invoke-direct {v2, v3, v4}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    iput-object v2, p0, Lorg/eclipse/jgit/transport/TransportHttp;->objectsUrl:Ljava/net/URL;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 286
    new-instance v2, Lorg/eclipse/jgit/transport/TransportHttp$HttpConfig;

    invoke-direct {v2, v6}, Lorg/eclipse/jgit/transport/TransportHttp$HttpConfig;-><init>(Lorg/eclipse/jgit/transport/TransportHttp$1;)V

    iput-object v2, p0, Lorg/eclipse/jgit/transport/TransportHttp;->http:Lorg/eclipse/jgit/transport/TransportHttp$HttpConfig;

    .line 287
    invoke-static {}, Ljava/net/ProxySelector;->getDefault()Ljava/net/ProxySelector;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/transport/TransportHttp;->proxySelector:Ljava/net/ProxySelector;

    .line 288
    return-void

    .line 283
    .end local v1           #uriString:Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 284
    .local v0, e:Ljava/net/MalformedURLException;
    new-instance v2, Lorg/eclipse/jgit/errors/NotSupportedException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->invalidURL:Ljava/lang/String;

    new-array v4, v5, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lorg/eclipse/jgit/errors/NotSupportedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method static synthetic access$300(Lorg/eclipse/jgit/transport/TransportHttp;)Ljava/net/URL;
    .locals 1
    .parameter "x0"

    .prologue
    .line 130
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp;->baseUrl:Ljava/net/URL;

    return-object v0
.end method

.method static synthetic access$400(Lorg/eclipse/jgit/transport/TransportHttp;)Lorg/eclipse/jgit/transport/TransportHttp$HttpConfig;
    .locals 1
    .parameter "x0"

    .prologue
    .line 130
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp;->http:Lorg/eclipse/jgit/transport/TransportHttp$HttpConfig;

    return-object v0
.end method

.method private static computeUserAgent()Ljava/lang/String;
    .locals 4

    .prologue
    .line 209
    const-class v2, Lorg/eclipse/jgit/transport/TransportHttp;

    invoke-virtual {v2}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v0

    .line 210
    .local v0, pkg:Ljava/lang/Package;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Package;->getImplementationVersion()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 211
    invoke-virtual {v0}, Ljava/lang/Package;->getImplementationVersion()Ljava/lang/String;

    move-result-object v1

    .line 215
    .local v1, version:Ljava/lang/String;
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "JGit/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 213
    .end local v1           #version:Ljava/lang/String;
    :cond_0
    const-string v1, "unknown"

    .restart local v1       #version:Ljava/lang/String;
    goto :goto_0
.end method

.method private connect(Ljava/lang/String;)Lorg/eclipse/jgit/transport/http/HttpConnection;
    .locals 16
    .parameter "service"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;,
            Lorg/eclipse/jgit/errors/NotSupportedException;
        }
    .end annotation

    .prologue
    .line 447
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 448
    .local v2, b:Ljava/lang/StringBuilder;
    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/eclipse/jgit/transport/TransportHttp;->baseUrl:Ljava/net/URL;

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 450
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v10

    add-int/lit8 v10, v10, -0x1

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v10

    const/16 v11, 0x2f

    if-eq v10, v11, :cond_0

    .line 451
    const/16 v10, 0x2f

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 452
    :cond_0
    const-string v10, "info/refs"

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 454
    move-object/from16 v0, p0

    iget-boolean v10, v0, Lorg/eclipse/jgit/transport/TransportHttp;->useSmartHttp:Z

    if-eqz v10, :cond_1

    .line 455
    const-string v10, "?"

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;)I

    move-result v10

    if-gez v10, :cond_2

    const/16 v10, 0x3f

    :goto_0
    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 456
    const-string v10, "service="

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 457
    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 460
    :cond_1
    new-instance v9, Ljava/net/URL;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_1

    .line 466
    .local v9, u:Ljava/net/URL;
    const/4 v1, 0x1

    .line 468
    .local v1, authAttempts:I
    :goto_1
    :try_start_1
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lorg/eclipse/jgit/transport/TransportHttp;->httpOpen(Ljava/net/URL;)Lorg/eclipse/jgit/transport/http/HttpConnection;

    move-result-object v3

    .line 469
    .local v3, conn:Lorg/eclipse/jgit/transport/http/HttpConnection;
    move-object/from16 v0, p0

    iget-boolean v10, v0, Lorg/eclipse/jgit/transport/TransportHttp;->useSmartHttp:Z

    if-eqz v10, :cond_3

    .line 470
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "application/x-"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move-object/from16 v0, p1

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "-advertisement"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 471
    .local v7, exp:Ljava/lang/String;
    const-string v10, "Accept"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ", */*"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v3, v10, v11}, Lorg/eclipse/jgit/transport/http/HttpConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 475
    .end local v7           #exp:Ljava/lang/String;
    :goto_2
    invoke-static {v3}, Lorg/eclipse/jgit/util/HttpSupport;->response(Lorg/eclipse/jgit/transport/http/HttpConnection;)I

    move-result v8

    .line 476
    .local v8, status:I
    sparse-switch v8, :sswitch_data_0

    .line 512
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-interface {v3}, Lorg/eclipse/jgit/transport/http/HttpConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 513
    .local v6, err:Ljava/lang/String;
    new-instance v10, Lorg/eclipse/jgit/errors/TransportException;

    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/eclipse/jgit/transport/TransportHttp;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-direct {v10, v11, v6}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v10
    :try_end_1
    .catch Lorg/eclipse/jgit/errors/NotSupportedException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/eclipse/jgit/errors/TransportException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3

    .line 516
    .end local v3           #conn:Lorg/eclipse/jgit/transport/http/HttpConnection;
    .end local v6           #err:Ljava/lang/String;
    .end local v8           #status:I
    :catch_0
    move-exception v5

    .line 517
    .local v5, e:Lorg/eclipse/jgit/errors/NotSupportedException;
    throw v5

    .line 455
    .end local v1           #authAttempts:I
    .end local v5           #e:Lorg/eclipse/jgit/errors/NotSupportedException;
    .end local v9           #u:Ljava/net/URL;
    :cond_2
    const/16 v10, 0x26

    goto/16 :goto_0

    .line 461
    .end local v2           #b:Ljava/lang/StringBuilder;
    :catch_1
    move-exception v5

    .line 462
    .local v5, e:Ljava/net/MalformedURLException;
    new-instance v10, Lorg/eclipse/jgit/errors/NotSupportedException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v11

    iget-object v11, v11, Lorg/eclipse/jgit/internal/JGitText;->invalidURL:Ljava/lang/String;

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/transport/TransportHttp;->uri:Lorg/eclipse/jgit/transport/URIish;

    aput-object v14, v12, v13

    invoke-static {v11, v12}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11, v5}, Lorg/eclipse/jgit/errors/NotSupportedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 473
    .end local v5           #e:Ljava/net/MalformedURLException;
    .restart local v1       #authAttempts:I
    .restart local v2       #b:Ljava/lang/StringBuilder;
    .restart local v3       #conn:Lorg/eclipse/jgit/transport/http/HttpConnection;
    .restart local v9       #u:Ljava/net/URL;
    :cond_3
    :try_start_2
    const-string v10, "Accept"

    const-string v11, "*/*"

    invoke-interface {v3, v10, v11}, Lorg/eclipse/jgit/transport/http/HttpConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/eclipse/jgit/errors/NotSupportedException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lorg/eclipse/jgit/errors/TransportException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    goto :goto_2

    .line 518
    .end local v3           #conn:Lorg/eclipse/jgit/transport/http/HttpConnection;
    :catch_2
    move-exception v5

    .line 519
    .local v5, e:Lorg/eclipse/jgit/errors/TransportException;
    throw v5

    .line 482
    .end local v5           #e:Lorg/eclipse/jgit/errors/TransportException;
    .restart local v3       #conn:Lorg/eclipse/jgit/transport/http/HttpConnection;
    .restart local v8       #status:I
    :sswitch_0
    :try_start_3
    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/eclipse/jgit/transport/TransportHttp;->authMethod:Lorg/eclipse/jgit/transport/HttpAuthMethod;

    invoke-virtual {v10}, Lorg/eclipse/jgit/transport/HttpAuthMethod;->getType()Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

    move-result-object v10

    sget-object v11, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;->NONE:Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

    if-ne v10, v11, :cond_4

    const-string v10, "WWW-Authenticate"

    invoke-interface {v3, v10}, Lorg/eclipse/jgit/transport/http/HttpConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_4

    .line 484
    invoke-static {v3}, Lorg/eclipse/jgit/transport/HttpAuthMethod;->scanResponse(Lorg/eclipse/jgit/transport/http/HttpConnection;)Lorg/eclipse/jgit/transport/HttpAuthMethod;

    move-result-object v10

    move-object/from16 v0, p0

    iput-object v10, v0, Lorg/eclipse/jgit/transport/TransportHttp;->authMethod:Lorg/eclipse/jgit/transport/HttpAuthMethod;

    .line 485
    :cond_4
    return-object v3

    .line 488
    :sswitch_1
    new-instance v10, Lorg/eclipse/jgit/errors/NoRemoteRepositoryException;

    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/eclipse/jgit/transport/TransportHttp;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v12

    iget-object v12, v12, Lorg/eclipse/jgit/internal/JGitText;->uriNotFound:Ljava/lang/String;

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    aput-object v9, v13, v14

    invoke-static {v12, v13}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v10, v11, v12}, Lorg/eclipse/jgit/errors/NoRemoteRepositoryException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v10
    :try_end_3
    .catch Lorg/eclipse/jgit/errors/NotSupportedException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Lorg/eclipse/jgit/errors/TransportException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    .line 520
    .end local v3           #conn:Lorg/eclipse/jgit/transport/http/HttpConnection;
    .end local v8           #status:I
    :catch_3
    move-exception v5

    .line 521
    .local v5, e:Ljava/io/IOException;
    new-instance v10, Lorg/eclipse/jgit/errors/TransportException;

    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/eclipse/jgit/transport/TransportHttp;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v12

    iget-object v12, v12, Lorg/eclipse/jgit/internal/JGitText;->cannotOpenService:Ljava/lang/String;

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    aput-object p1, v13, v14

    invoke-static {v12, v13}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v10, v11, v12, v5}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 492
    .end local v5           #e:Ljava/io/IOException;
    .restart local v3       #conn:Lorg/eclipse/jgit/transport/http/HttpConnection;
    .restart local v8       #status:I
    :sswitch_2
    :try_start_4
    invoke-static {v3}, Lorg/eclipse/jgit/transport/HttpAuthMethod;->scanResponse(Lorg/eclipse/jgit/transport/http/HttpConnection;)Lorg/eclipse/jgit/transport/HttpAuthMethod;

    move-result-object v10

    move-object/from16 v0, p0

    iput-object v10, v0, Lorg/eclipse/jgit/transport/TransportHttp;->authMethod:Lorg/eclipse/jgit/transport/HttpAuthMethod;

    .line 493
    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/eclipse/jgit/transport/TransportHttp;->authMethod:Lorg/eclipse/jgit/transport/HttpAuthMethod;

    invoke-virtual {v10}, Lorg/eclipse/jgit/transport/HttpAuthMethod;->getType()Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

    move-result-object v10

    sget-object v11, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;->NONE:Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

    if-ne v10, v11, :cond_5

    .line 494
    new-instance v10, Lorg/eclipse/jgit/errors/TransportException;

    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/eclipse/jgit/transport/TransportHttp;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v12

    iget-object v12, v12, Lorg/eclipse/jgit/internal/JGitText;->authenticationNotSupported:Ljava/lang/String;

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/eclipse/jgit/transport/TransportHttp;->uri:Lorg/eclipse/jgit/transport/URIish;

    aput-object v15, v13, v14

    invoke-static {v12, v13}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v10, v11, v12}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v10

    .line 496
    :cond_5
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/transport/TransportHttp;->getCredentialsProvider()Lorg/eclipse/jgit/transport/CredentialsProvider;

    move-result-object v4

    .line 497
    .local v4, credentialsProvider:Lorg/eclipse/jgit/transport/CredentialsProvider;
    const/4 v10, 0x1

    if-le v1, v10, :cond_6

    .line 498
    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/eclipse/jgit/transport/TransportHttp;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v4, v10}, Lorg/eclipse/jgit/transport/CredentialsProvider;->reset(Lorg/eclipse/jgit/transport/URIish;)V

    .line 499
    :cond_6
    const/4 v10, 0x3

    if-lt v10, v1, :cond_7

    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/eclipse/jgit/transport/TransportHttp;->authMethod:Lorg/eclipse/jgit/transport/HttpAuthMethod;

    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/eclipse/jgit/transport/TransportHttp;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v10, v11, v4}, Lorg/eclipse/jgit/transport/HttpAuthMethod;->authorize(Lorg/eclipse/jgit/transport/URIish;Lorg/eclipse/jgit/transport/CredentialsProvider;)Z

    move-result v10

    if-nez v10, :cond_8

    .line 501
    :cond_7
    new-instance v10, Lorg/eclipse/jgit/errors/TransportException;

    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/eclipse/jgit/transport/TransportHttp;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v12

    iget-object v12, v12, Lorg/eclipse/jgit/internal/JGitText;->notAuthorized:Ljava/lang/String;

    invoke-direct {v10, v11, v12}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v10

    .line 504
    :cond_8
    add-int/lit8 v1, v1, 0x1

    .line 505
    goto/16 :goto_1

    .line 508
    .end local v4           #credentialsProvider:Lorg/eclipse/jgit/transport/CredentialsProvider;
    :sswitch_3
    new-instance v10, Lorg/eclipse/jgit/errors/TransportException;

    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/eclipse/jgit/transport/TransportHttp;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v12

    iget-object v12, v12, Lorg/eclipse/jgit/internal/JGitText;->serviceNotPermitted:Ljava/lang/String;

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    aput-object p1, v13, v14

    invoke-static {v12, v13}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v10, v11, v12}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v10
    :try_end_4
    .catch Lorg/eclipse/jgit/errors/NotSupportedException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Lorg/eclipse/jgit/errors/TransportException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 476
    :sswitch_data_0
    .sparse-switch
        0xc8 -> :sswitch_0
        0x191 -> :sswitch_2
        0x193 -> :sswitch_3
        0x194 -> :sswitch_1
    .end sparse-switch
.end method

.method private disableSslVerify(Lorg/eclipse/jgit/transport/http/HttpConnection;)V
    .locals 5
    .parameter "conn"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 568
    const/4 v2, 0x1

    new-array v1, v2, [Ljavax/net/ssl/TrustManager;

    const/4 v2, 0x0

    new-instance v3, Lorg/eclipse/jgit/transport/TransportHttp$DummyX509TrustManager;

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/transport/TransportHttp$DummyX509TrustManager;-><init>(Lorg/eclipse/jgit/transport/TransportHttp$1;)V

    aput-object v3, v1, v2

    .line 570
    .local v1, trustAllCerts:[Ljavax/net/ssl/TrustManager;
    const/4 v2, 0x0

    const/4 v3, 0x0

    :try_start_0
    invoke-interface {p1, v2, v1, v3}, Lorg/eclipse/jgit/transport/http/HttpConnection;->configure([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 571
    new-instance v2, Lorg/eclipse/jgit/transport/TransportHttp$DummyHostnameVerifier;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/transport/TransportHttp$DummyHostnameVerifier;-><init>(Lorg/eclipse/jgit/transport/TransportHttp$1;)V

    invoke-interface {p1, v2}, Lorg/eclipse/jgit/transport/http/HttpConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V
    :try_end_0
    .catch Ljava/security/KeyManagementException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_1

    .line 577
    return-void

    .line 572
    :catch_0
    move-exception v0

    .line 573
    .local v0, e:Ljava/security/KeyManagementException;
    new-instance v2, Ljava/io/IOException;

    invoke-virtual {v0}, Ljava/security/KeyManagementException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 574
    .end local v0           #e:Ljava/security/KeyManagementException;
    :catch_1
    move-exception v0

    .line 575
    .local v0, e:Ljava/security/NoSuchAlgorithmException;
    new-instance v2, Ljava/io/IOException;

    invoke-virtual {v0}, Ljava/security/NoSuchAlgorithmException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private isSmartHttp(Lorg/eclipse/jgit/transport/http/HttpConnection;Ljava/lang/String;)Z
    .locals 4
    .parameter "c"
    .parameter "service"

    .prologue
    .line 593
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "application/x-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "-advertisement"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 594
    .local v1, expType:Ljava/lang/String;
    invoke-interface {p1}, Lorg/eclipse/jgit/transport/http/HttpConnection;->getContentType()Ljava/lang/String;

    move-result-object v0

    .line 595
    .local v0, actType:Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    return v2
.end method

.method private newDumbConnection(Ljava/io/InputStream;)Lorg/eclipse/jgit/transport/FetchConnection;
    .locals 17
    .parameter "in"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/PackProtocolException;
        }
    .end annotation

    .prologue
    .line 336
    new-instance v3, Lorg/eclipse/jgit/transport/TransportHttp$HttpObjectDB;

    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/eclipse/jgit/transport/TransportHttp;->objectsUrl:Ljava/net/URL;

    move-object/from16 v0, p0

    invoke-direct {v3, v0, v11}, Lorg/eclipse/jgit/transport/TransportHttp$HttpObjectDB;-><init>(Lorg/eclipse/jgit/transport/TransportHttp;Ljava/net/URL;)V

    .line 337
    .local v3, d:Lorg/eclipse/jgit/transport/TransportHttp$HttpObjectDB;
    invoke-direct/range {p0 .. p1}, Lorg/eclipse/jgit/transport/TransportHttp;->toBufferedReader(Ljava/io/InputStream;)Ljava/io/BufferedReader;

    move-result-object v1

    .line 340
    .local v1, br:Ljava/io/BufferedReader;
    :try_start_0
    invoke-virtual {v3, v1}, Lorg/eclipse/jgit/transport/TransportHttp$HttpObjectDB;->readAdvertisedImpl(Ljava/io/BufferedReader;)Ljava/util/Map;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v7

    .line 342
    .local v7, refs:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 345
    const-string v11, "HEAD"

    invoke-interface {v7, v11}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_1

    .line 350
    new-instance v11, Ljava/net/URL;

    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/transport/TransportHttp;->baseUrl:Ljava/net/URL;

    const-string v13, "HEAD"

    invoke-direct {v11, v12, v13}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lorg/eclipse/jgit/transport/TransportHttp;->httpOpen(Ljava/net/URL;)Lorg/eclipse/jgit/transport/http/HttpConnection;

    move-result-object v2

    .line 351
    .local v2, conn:Lorg/eclipse/jgit/transport/http/HttpConnection;
    invoke-static {v2}, Lorg/eclipse/jgit/util/HttpSupport;->response(Lorg/eclipse/jgit/transport/http/HttpConnection;)I

    move-result v8

    .line 352
    .local v8, status:I
    sparse-switch v8, :sswitch_data_0

    .line 379
    new-instance v11, Lorg/eclipse/jgit/errors/TransportException;

    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/transport/TransportHttp;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v13

    iget-object v13, v13, Lorg/eclipse/jgit/internal/JGitText;->cannotReadHEAD:Ljava/lang/String;

    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x1

    invoke-interface {v2}, Lorg/eclipse/jgit/transport/http/HttpConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v13, v14}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v11, v12, v13}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v11

    .line 342
    .end local v2           #conn:Lorg/eclipse/jgit/transport/http/HttpConnection;
    .end local v7           #refs:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    .end local v8           #status:I
    :catchall_0
    move-exception v11

    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    throw v11

    .line 354
    .restart local v2       #conn:Lorg/eclipse/jgit/transport/http/HttpConnection;
    .restart local v7       #refs:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    .restart local v8       #status:I
    :sswitch_0
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/eclipse/jgit/transport/TransportHttp;->openInputStream(Lorg/eclipse/jgit/transport/http/HttpConnection;)Ljava/io/InputStream;

    move-result-object v11

    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Lorg/eclipse/jgit/transport/TransportHttp;->toBufferedReader(Ljava/io/InputStream;)Ljava/io/BufferedReader;

    move-result-object v1

    .line 356
    :try_start_1
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 357
    .local v4, line:Ljava/lang/String;
    if-eqz v4, :cond_2

    const-string v11, "ref: "

    invoke-virtual {v4, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 358
    const-string v11, "ref: "

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    invoke-virtual {v4, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    .line 359
    .local v9, target:Ljava/lang/String;
    invoke-interface {v7, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/lib/Ref;

    .line 360
    .local v5, r:Lorg/eclipse/jgit/lib/Ref;
    if-nez v5, :cond_3

    .line 361
    new-instance v5, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;

    .end local v5           #r:Lorg/eclipse/jgit/lib/Ref;
    sget-object v11, Lorg/eclipse/jgit/lib/Ref$Storage;->NEW:Lorg/eclipse/jgit/lib/Ref$Storage;

    const/4 v12, 0x0

    invoke-direct {v5, v11, v9, v12}, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    .restart local v5       #r:Lorg/eclipse/jgit/lib/Ref;
    move-object v6, v5

    .line 362
    .end local v5           #r:Lorg/eclipse/jgit/lib/Ref;
    .local v6, r:Lorg/eclipse/jgit/lib/Ref;
    :goto_0
    new-instance v5, Lorg/eclipse/jgit/lib/SymbolicRef;

    const-string v11, "HEAD"

    invoke-direct {v5, v11, v6}, Lorg/eclipse/jgit/lib/SymbolicRef;-><init>(Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;)V

    .line 363
    .end local v6           #r:Lorg/eclipse/jgit/lib/Ref;
    .restart local v5       #r:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v5}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v7, v11, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 370
    .end local v5           #r:Lorg/eclipse/jgit/lib/Ref;
    .end local v9           #target:Ljava/lang/String;
    :cond_0
    :goto_1
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 385
    .end local v2           #conn:Lorg/eclipse/jgit/transport/http/HttpConnection;
    .end local v4           #line:Ljava/lang/String;
    .end local v8           #status:I
    :cond_1
    :sswitch_1
    new-instance v10, Lorg/eclipse/jgit/transport/WalkFetchConnection;

    move-object/from16 v0, p0

    invoke-direct {v10, v0, v3}, Lorg/eclipse/jgit/transport/WalkFetchConnection;-><init>(Lorg/eclipse/jgit/transport/WalkTransport;Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;)V

    .line 386
    .local v10, wfc:Lorg/eclipse/jgit/transport/WalkFetchConnection;
    invoke-virtual {v10, v7}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->available(Ljava/util/Map;)V

    .line 387
    return-object v10

    .line 364
    .end local v10           #wfc:Lorg/eclipse/jgit/transport/WalkFetchConnection;
    .restart local v2       #conn:Lorg/eclipse/jgit/transport/http/HttpConnection;
    .restart local v4       #line:Ljava/lang/String;
    .restart local v8       #status:I
    :cond_2
    if-eqz v4, :cond_0

    :try_start_2
    invoke-static {v4}, Lorg/eclipse/jgit/lib/ObjectId;->isId(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 365
    new-instance v5, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;

    sget-object v11, Lorg/eclipse/jgit/lib/Ref$Storage;->NETWORK:Lorg/eclipse/jgit/lib/Ref$Storage;

    const-string v12, "HEAD"

    invoke-static {v4}, Lorg/eclipse/jgit/lib/ObjectId;->fromString(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v13

    invoke-direct {v5, v11, v12, v13}, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 367
    .restart local v5       #r:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v5}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v7, v11, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_1

    .line 370
    .end local v4           #line:Ljava/lang/String;
    .end local v5           #r:Lorg/eclipse/jgit/lib/Ref;
    :catchall_1
    move-exception v11

    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    throw v11

    .restart local v4       #line:Ljava/lang/String;
    .restart local v5       #r:Lorg/eclipse/jgit/lib/Ref;
    .restart local v9       #target:Ljava/lang/String;
    :cond_3
    move-object v6, v5

    .end local v5           #r:Lorg/eclipse/jgit/lib/Ref;
    .restart local v6       #r:Lorg/eclipse/jgit/lib/Ref;
    goto :goto_0

    .line 352
    nop

    :sswitch_data_0
    .sparse-switch
        0xc8 -> :sswitch_0
        0x194 -> :sswitch_1
    .end sparse-switch
.end method

.method private readSmartHeaders(Ljava/io/InputStream;Ljava/lang/String;)V
    .locals 10
    .parameter "in"
    .parameter "service"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x2

    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 605
    const/4 v4, 0x5

    new-array v2, v4, [B

    .line 606
    .local v2, magic:[B
    array-length v4, v2

    invoke-static {p1, v2, v9, v4}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 607
    const/4 v4, 0x4

    aget-byte v4, v2, v4

    const/16 v5, 0x23

    if-eq v4, v5, :cond_0

    .line 608
    new-instance v4, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v5, p0, Lorg/eclipse/jgit/transport/TransportHttp;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v6

    iget-object v6, v6, Lorg/eclipse/jgit/internal/JGitText;->expectedPktLineWithService:Ljava/lang/String;

    new-array v7, v8, [Ljava/lang/Object;

    invoke-static {v2}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([B)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-static {v6, v7}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v4

    .line 612
    :cond_0
    new-instance v3, Lorg/eclipse/jgit/transport/PacketLineIn;

    new-instance v4, Lorg/eclipse/jgit/util/io/UnionInputStream;

    new-array v5, v7, [Ljava/io/InputStream;

    new-instance v6, Ljava/io/ByteArrayInputStream;

    invoke-direct {v6, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    aput-object v6, v5, v9

    aput-object p1, v5, v8

    invoke-direct {v4, v5}, Lorg/eclipse/jgit/util/io/UnionInputStream;-><init>([Ljava/io/InputStream;)V

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/transport/PacketLineIn;-><init>(Ljava/io/InputStream;)V

    .line 614
    .local v3, pckIn:Lorg/eclipse/jgit/transport/PacketLineIn;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "# service="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 615
    .local v1, exp:Ljava/lang/String;
    invoke-virtual {v3}, Lorg/eclipse/jgit/transport/PacketLineIn;->readString()Ljava/lang/String;

    move-result-object v0

    .line 616
    .local v0, act:Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 617
    new-instance v4, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v5, p0, Lorg/eclipse/jgit/transport/TransportHttp;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v6

    iget-object v6, v6, Lorg/eclipse/jgit/internal/JGitText;->expectedGot:Ljava/lang/String;

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v1, v7, v9

    aput-object v0, v7, v8

    invoke-static {v6, v7}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v4

    .line 621
    :cond_1
    invoke-virtual {v3}, Lorg/eclipse/jgit/transport/PacketLineIn;->readString()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lorg/eclipse/jgit/transport/PacketLineIn;->END:Ljava/lang/String;

    if-ne v4, v5, :cond_1

    .line 624
    return-void
.end method

.method private toBufferedReader(Ljava/io/InputStream;)Ljava/io/BufferedReader;
    .locals 3
    .parameter "in"

    .prologue
    .line 391
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    sget-object v2, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    invoke-direct {v1, p1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    return-object v0
.end method


# virtual methods
.method public close()V
    .locals 0

    .prologue
    .line 429
    return-void
.end method

.method protected httpOpen(Ljava/lang/String;Ljava/net/URL;)Lorg/eclipse/jgit/transport/http/HttpConnection;
    .locals 8
    .parameter "method"
    .parameter "u"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 540
    iget-object v6, p0, Lorg/eclipse/jgit/transport/TransportHttp;->proxySelector:Ljava/net/ProxySelector;

    invoke-static {v6, p2}, Lorg/eclipse/jgit/util/HttpSupport;->proxyFor(Ljava/net/ProxySelector;Ljava/net/URL;)Ljava/net/Proxy;

    move-result-object v4

    .line 541
    .local v4, proxy:Ljava/net/Proxy;
    sget-object v6, Lorg/eclipse/jgit/transport/TransportHttp;->connectionFactory:Lorg/eclipse/jgit/transport/http/HttpConnectionFactory;

    invoke-interface {v6, p2, v4}, Lorg/eclipse/jgit/transport/http/HttpConnectionFactory;->create(Ljava/net/URL;Ljava/net/Proxy;)Lorg/eclipse/jgit/transport/http/HttpConnection;

    move-result-object v0

    .line 543
    .local v0, conn:Lorg/eclipse/jgit/transport/http/HttpConnection;
    iget-object v6, p0, Lorg/eclipse/jgit/transport/TransportHttp;->http:Lorg/eclipse/jgit/transport/TransportHttp$HttpConfig;

    iget-boolean v6, v6, Lorg/eclipse/jgit/transport/TransportHttp$HttpConfig;->sslVerify:Z

    if-nez v6, :cond_0

    const-string v6, "https"

    invoke-virtual {p2}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 544
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/transport/TransportHttp;->disableSslVerify(Lorg/eclipse/jgit/transport/http/HttpConnection;)V

    .line 547
    :cond_0
    invoke-interface {v0, p1}, Lorg/eclipse/jgit/transport/http/HttpConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 548
    const/4 v6, 0x0

    invoke-interface {v0, v6}, Lorg/eclipse/jgit/transport/http/HttpConnection;->setUseCaches(Z)V

    .line 549
    const-string v6, "Accept-Encoding"

    const-string v7, "gzip"

    invoke-interface {v0, v6, v7}, Lorg/eclipse/jgit/transport/http/HttpConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 550
    const-string v6, "Pragma"

    const-string v7, "no-cache"

    invoke-interface {v0, v6, v7}, Lorg/eclipse/jgit/transport/http/HttpConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 551
    const-string v6, "User-Agent"

    sget-object v7, Lorg/eclipse/jgit/transport/TransportHttp;->userAgent:Ljava/lang/String;

    invoke-interface {v0, v6, v7}, Lorg/eclipse/jgit/transport/http/HttpConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 552
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportHttp;->getTimeout()I

    move-result v5

    .line 553
    .local v5, timeOut:I
    const/4 v6, -0x1

    if-eq v5, v6, :cond_1

    .line 554
    mul-int/lit16 v1, v5, 0x3e8

    .line 555
    .local v1, effTimeOut:I
    invoke-interface {v0, v1}, Lorg/eclipse/jgit/transport/http/HttpConnection;->setConnectTimeout(I)V

    .line 556
    invoke-interface {v0, v1}, Lorg/eclipse/jgit/transport/http/HttpConnection;->setReadTimeout(I)V

    .line 558
    .end local v1           #effTimeOut:I
    :cond_1
    iget-object v6, p0, Lorg/eclipse/jgit/transport/TransportHttp;->headers:Ljava/util/Map;

    if-eqz v6, :cond_2

    iget-object v6, p0, Lorg/eclipse/jgit/transport/TransportHttp;->headers:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_2

    .line 559
    iget-object v6, p0, Lorg/eclipse/jgit/transport/TransportHttp;->headers:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 560
    .local v2, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-interface {v0, v6, v7}, Lorg/eclipse/jgit/transport/http/HttpConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 562
    .end local v2           #entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3           #i$:Ljava/util/Iterator;
    :cond_2
    iget-object v6, p0, Lorg/eclipse/jgit/transport/TransportHttp;->authMethod:Lorg/eclipse/jgit/transport/HttpAuthMethod;

    invoke-virtual {v6, v0}, Lorg/eclipse/jgit/transport/HttpAuthMethod;->configureRequest(Lorg/eclipse/jgit/transport/http/HttpConnection;)V

    .line 563
    return-object v0
.end method

.method final httpOpen(Ljava/net/URL;)Lorg/eclipse/jgit/transport/http/HttpConnection;
    .locals 1
    .parameter "u"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 526
    const-string v0, "GET"

    invoke-virtual {p0, v0, p1}, Lorg/eclipse/jgit/transport/TransportHttp;->httpOpen(Ljava/lang/String;Ljava/net/URL;)Lorg/eclipse/jgit/transport/http/HttpConnection;

    move-result-object v0

    return-object v0
.end method

.method public openFetch()Lorg/eclipse/jgit/transport/FetchConnection;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;,
            Lorg/eclipse/jgit/errors/NotSupportedException;
        }
    .end annotation

    .prologue
    .line 307
    const-string v3, "git-upload-pack"

    .line 309
    .local v3, service:Ljava/lang/String;
    :try_start_0
    const-string v4, "git-upload-pack"

    invoke-direct {p0, v4}, Lorg/eclipse/jgit/transport/TransportHttp;->connect(Ljava/lang/String;)Lorg/eclipse/jgit/transport/http/HttpConnection;

    move-result-object v0

    .line 310
    .local v0, c:Lorg/eclipse/jgit/transport/http/HttpConnection;
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/TransportHttp;->openInputStream(Lorg/eclipse/jgit/transport/http/HttpConnection;)Ljava/io/InputStream;
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/NotSupportedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/eclipse/jgit/errors/TransportException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v2

    .line 312
    .local v2, in:Ljava/io/InputStream;
    :try_start_1
    const-string v4, "git-upload-pack"

    invoke-direct {p0, v0, v4}, Lorg/eclipse/jgit/transport/TransportHttp;->isSmartHttp(Lorg/eclipse/jgit/transport/http/HttpConnection;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 313
    const-string v4, "git-upload-pack"

    invoke-direct {p0, v2, v4}, Lorg/eclipse/jgit/transport/TransportHttp;->readSmartHeaders(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 314
    new-instance v4, Lorg/eclipse/jgit/transport/TransportHttp$SmartHttpFetchConnection;

    invoke-direct {v4, p0, v2}, Lorg/eclipse/jgit/transport/TransportHttp$SmartHttpFetchConnection;-><init>(Lorg/eclipse/jgit/transport/TransportHttp;Ljava/io/InputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 323
    :try_start_2
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Lorg/eclipse/jgit/errors/NotSupportedException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lorg/eclipse/jgit/errors/TransportException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    :goto_0
    return-object v4

    .line 320
    :cond_0
    :try_start_3
    invoke-direct {p0, v2}, Lorg/eclipse/jgit/transport/TransportHttp;->newDumbConnection(Ljava/io/InputStream;)Lorg/eclipse/jgit/transport/FetchConnection;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v4

    .line 323
    :try_start_4
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Lorg/eclipse/jgit/errors/NotSupportedException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Lorg/eclipse/jgit/errors/TransportException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_0

    .line 325
    .end local v0           #c:Lorg/eclipse/jgit/transport/http/HttpConnection;
    .end local v2           #in:Ljava/io/InputStream;
    :catch_0
    move-exception v1

    .line 326
    .local v1, err:Lorg/eclipse/jgit/errors/NotSupportedException;
    throw v1

    .line 323
    .end local v1           #err:Lorg/eclipse/jgit/errors/NotSupportedException;
    .restart local v0       #c:Lorg/eclipse/jgit/transport/http/HttpConnection;
    .restart local v2       #in:Ljava/io/InputStream;
    :catchall_0
    move-exception v4

    :try_start_5
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    throw v4
    :try_end_5
    .catch Lorg/eclipse/jgit/errors/NotSupportedException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Lorg/eclipse/jgit/errors/TransportException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    .line 327
    .end local v0           #c:Lorg/eclipse/jgit/transport/http/HttpConnection;
    .end local v2           #in:Ljava/io/InputStream;
    :catch_1
    move-exception v1

    .line 328
    .local v1, err:Lorg/eclipse/jgit/errors/TransportException;
    throw v1

    .line 329
    .end local v1           #err:Lorg/eclipse/jgit/errors/TransportException;
    :catch_2
    move-exception v1

    .line 330
    .local v1, err:Ljava/io/IOException;
    new-instance v4, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v5, p0, Lorg/eclipse/jgit/transport/TransportHttp;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v6

    iget-object v6, v6, Lorg/eclipse/jgit/internal/JGitText;->errorReadingInfoRefs:Ljava/lang/String;

    invoke-direct {v4, v5, v6, v1}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method

.method final openInputStream(Lorg/eclipse/jgit/transport/http/HttpConnection;)Ljava/io/InputStream;
    .locals 4
    .parameter "conn"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 581
    invoke-interface {p1}, Lorg/eclipse/jgit/transport/http/HttpConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 582
    .local v0, input:Ljava/io/InputStream;
    const-string v2, "gzip"

    const-string v3, "Content-Encoding"

    invoke-interface {p1, v3}, Lorg/eclipse/jgit/transport/http/HttpConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 583
    new-instance v1, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v1, v0}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    .end local v0           #input:Ljava/io/InputStream;
    .local v1, input:Ljava/io/InputStream;
    move-object v0, v1

    .line 584
    .end local v1           #input:Ljava/io/InputStream;
    .restart local v0       #input:Ljava/io/InputStream;
    :cond_0
    return-object v0
.end method

.method public openPush()Lorg/eclipse/jgit/transport/PushConnection;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;,
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 397
    const-string v4, "git-receive-pack"

    .line 399
    .local v4, service:Ljava/lang/String;
    :try_start_0
    const-string v5, "git-receive-pack"

    invoke-direct {p0, v5}, Lorg/eclipse/jgit/transport/TransportHttp;->connect(Ljava/lang/String;)Lorg/eclipse/jgit/transport/http/HttpConnection;

    move-result-object v0

    .line 400
    .local v0, c:Lorg/eclipse/jgit/transport/http/HttpConnection;
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/TransportHttp;->openInputStream(Lorg/eclipse/jgit/transport/http/HttpConnection;)Ljava/io/InputStream;
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/NotSupportedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/eclipse/jgit/errors/TransportException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v2

    .line 402
    .local v2, in:Ljava/io/InputStream;
    :try_start_1
    const-string v5, "git-receive-pack"

    invoke-direct {p0, v0, v5}, Lorg/eclipse/jgit/transport/TransportHttp;->isSmartHttp(Lorg/eclipse/jgit/transport/http/HttpConnection;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 403
    const-string v5, "git-receive-pack"

    invoke-direct {p0, v2, v5}, Lorg/eclipse/jgit/transport/TransportHttp;->readSmartHeaders(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 404
    new-instance v5, Lorg/eclipse/jgit/transport/TransportHttp$SmartHttpPushConnection;

    invoke-direct {v5, p0, v2}, Lorg/eclipse/jgit/transport/TransportHttp$SmartHttpPushConnection;-><init>(Lorg/eclipse/jgit/transport/TransportHttp;Ljava/io/InputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 415
    :try_start_2
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Lorg/eclipse/jgit/errors/NotSupportedException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lorg/eclipse/jgit/errors/TransportException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    return-object v5

    .line 406
    :cond_0
    :try_start_3
    iget-boolean v5, p0, Lorg/eclipse/jgit/transport/TransportHttp;->useSmartHttp:Z

    if-nez v5, :cond_1

    .line 407
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v3, v5, Lorg/eclipse/jgit/internal/JGitText;->smartHTTPPushDisabled:Ljava/lang/String;

    .line 408
    .local v3, msg:Ljava/lang/String;
    new-instance v5, Lorg/eclipse/jgit/errors/NotSupportedException;

    invoke-direct {v5, v3}, Lorg/eclipse/jgit/errors/NotSupportedException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 415
    .end local v3           #msg:Ljava/lang/String;
    :catchall_0
    move-exception v5

    :try_start_4
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    throw v5
    :try_end_4
    .catch Lorg/eclipse/jgit/errors/NotSupportedException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Lorg/eclipse/jgit/errors/TransportException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 417
    .end local v0           #c:Lorg/eclipse/jgit/transport/http/HttpConnection;
    .end local v2           #in:Ljava/io/InputStream;
    :catch_0
    move-exception v1

    .line 418
    .local v1, err:Lorg/eclipse/jgit/errors/NotSupportedException;
    throw v1

    .line 411
    .end local v1           #err:Lorg/eclipse/jgit/errors/NotSupportedException;
    .restart local v0       #c:Lorg/eclipse/jgit/transport/http/HttpConnection;
    .restart local v2       #in:Ljava/io/InputStream;
    :cond_1
    :try_start_5
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v3, v5, Lorg/eclipse/jgit/internal/JGitText;->remoteDoesNotSupportSmartHTTPPush:Ljava/lang/String;

    .line 412
    .restart local v3       #msg:Ljava/lang/String;
    new-instance v5, Lorg/eclipse/jgit/errors/NotSupportedException;

    invoke-direct {v5, v3}, Lorg/eclipse/jgit/errors/NotSupportedException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 419
    .end local v0           #c:Lorg/eclipse/jgit/transport/http/HttpConnection;
    .end local v2           #in:Ljava/io/InputStream;
    .end local v3           #msg:Ljava/lang/String;
    :catch_1
    move-exception v1

    .line 420
    .local v1, err:Lorg/eclipse/jgit/errors/TransportException;
    throw v1

    .line 421
    .end local v1           #err:Lorg/eclipse/jgit/errors/TransportException;
    :catch_2
    move-exception v1

    .line 422
    .local v1, err:Ljava/io/IOException;
    new-instance v5, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v6, p0, Lorg/eclipse/jgit/transport/TransportHttp;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->errorReadingInfoRefs:Ljava/lang/String;

    invoke-direct {v5, v6, v7, v1}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5
.end method

.method public setAdditionalHeaders(Ljava/util/Map;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 440
    .local p1, headers:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iput-object p1, p0, Lorg/eclipse/jgit/transport/TransportHttp;->headers:Ljava/util/Map;

    .line 441
    return-void
.end method

.method public setUseSmartHttp(Z)V
    .locals 0
    .parameter "on"

    .prologue
    .line 301
    iput-boolean p1, p0, Lorg/eclipse/jgit/transport/TransportHttp;->useSmartHttp:Z

    .line 302
    return-void
.end method

.method wrongContentType(Ljava/lang/String;Ljava/lang/String;)Ljava/io/IOException;
    .locals 4
    .parameter "expType"
    .parameter "actType"

    .prologue
    .line 588
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->expectedReceivedContentType:Ljava/lang/String;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    aput-object p2, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 589
    .local v0, why:Ljava/lang/String;
    new-instance v1, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportHttp;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-direct {v1, v2, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    return-object v1
.end method
