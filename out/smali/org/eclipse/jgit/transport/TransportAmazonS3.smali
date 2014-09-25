.class public Lorg/eclipse/jgit/transport/TransportAmazonS3;
.super Lorg/eclipse/jgit/transport/HttpTransport;
.source "TransportAmazonS3.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/WalkTransport;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;
    }
.end annotation


# static fields
.field static final PROTO_S3:Lorg/eclipse/jgit/transport/TransportProtocol; = null

.field static final S3_SCHEME:Ljava/lang/String; = "amazon-s3"


# instance fields
.field private final bucket:Ljava/lang/String;

.field private final keyPrefix:Ljava/lang/String;

.field private final s3:Lorg/eclipse/jgit/transport/AmazonS3;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 103
    new-instance v0, Lorg/eclipse/jgit/transport/TransportAmazonS3$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/TransportAmazonS3$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/transport/TransportAmazonS3;->PROTO_S3:Lorg/eclipse/jgit/transport/TransportProtocol;

    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;)V
    .locals 3
    .parameter "local"
    .parameter "uri"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;
        }
    .end annotation

    .prologue
    .line 148
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/transport/HttpTransport;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;)V

    .line 150
    new-instance v1, Lorg/eclipse/jgit/transport/AmazonS3;

    invoke-direct {p0}, Lorg/eclipse/jgit/transport/TransportAmazonS3;->loadProperties()Ljava/util/Properties;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/transport/AmazonS3;-><init>(Ljava/util/Properties;)V

    iput-object v1, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3;->s3:Lorg/eclipse/jgit/transport/AmazonS3;

    .line 151
    invoke-virtual {p2}, Lorg/eclipse/jgit/transport/URIish;->getHost()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3;->bucket:Ljava/lang/String;

    .line 153
    invoke-virtual {p2}, Lorg/eclipse/jgit/transport/URIish;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 154
    .local v0, p:Ljava/lang/String;
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 155
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 156
    :cond_0
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 157
    const/4 v1, 0x0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 158
    :cond_1
    iput-object v0, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3;->keyPrefix:Ljava/lang/String;

    .line 159
    return-void
.end method

.method static synthetic access$000(Lorg/eclipse/jgit/transport/TransportAmazonS3;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 100
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3;->bucket:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lorg/eclipse/jgit/transport/TransportAmazonS3;)Lorg/eclipse/jgit/transport/AmazonS3;
    .locals 1
    .parameter "x0"

    .prologue
    .line 100
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3;->s3:Lorg/eclipse/jgit/transport/AmazonS3;

    return-object v0
.end method

.method private loadProperties()Ljava/util/Properties;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;
        }
    .end annotation

    .prologue
    .line 162
    iget-object v4, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3;->local:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 163
    new-instance v2, Ljava/io/File;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3;->local:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v4

    iget-object v5, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v5}, Lorg/eclipse/jgit/transport/URIish;->getUser()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 164
    .local v2, propsFile:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 165
    invoke-static {v2}, Lorg/eclipse/jgit/transport/TransportAmazonS3;->loadPropertiesFile(Ljava/io/File;)Ljava/util/Properties;

    move-result-object v1

    .line 181
    :goto_0
    return-object v1

    .line 168
    .end local v2           #propsFile:Ljava/io/File;
    :cond_0
    new-instance v2, Ljava/io/File;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3;->local:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/Repository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v4

    invoke-virtual {v4}, Lorg/eclipse/jgit/util/FS;->userHome()Ljava/io/File;

    move-result-object v4

    iget-object v5, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v5}, Lorg/eclipse/jgit/transport/URIish;->getUser()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 169
    .restart local v2       #propsFile:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 170
    invoke-static {v2}, Lorg/eclipse/jgit/transport/TransportAmazonS3;->loadPropertiesFile(Ljava/io/File;)Ljava/util/Properties;

    move-result-object v1

    goto :goto_0

    .line 172
    :cond_1
    new-instance v1, Ljava/util/Properties;

    invoke-direct {v1}, Ljava/util/Properties;-><init>()V

    .line 173
    .local v1, props:Ljava/util/Properties;
    iget-object v4, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v4}, Lorg/eclipse/jgit/transport/URIish;->getUser()Ljava/lang/String;

    move-result-object v3

    .line 174
    .local v3, user:Ljava/lang/String;
    iget-object v4, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v4}, Lorg/eclipse/jgit/transport/URIish;->getPass()Ljava/lang/String;

    move-result-object v0

    .line 175
    .local v0, pass:Ljava/lang/String;
    if-eqz v3, :cond_2

    if-eqz v0, :cond_2

    .line 176
    const-string v4, "accesskey"

    invoke-virtual {v1, v4, v3}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 177
    const-string v4, "secretkey"

    invoke-virtual {v1, v4, v0}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    goto :goto_0

    .line 179
    :cond_2
    new-instance v4, Lorg/eclipse/jgit/errors/NotSupportedException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->cannotReadFile:Ljava/lang/String;

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v2, v6, v7

    invoke-static {v5, v6}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/eclipse/jgit/errors/NotSupportedException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method private static loadPropertiesFile(Ljava/io/File;)Ljava/util/Properties;
    .locals 5
    .parameter "propsFile"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;
        }
    .end annotation

    .prologue
    .line 187
    :try_start_0
    invoke-static {p0}, Lorg/eclipse/jgit/transport/AmazonS3;->properties(Ljava/io/File;)Ljava/util/Properties;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 188
    :catch_0
    move-exception v0

    .line 189
    .local v0, e:Ljava/io/IOException;
    new-instance v1, Lorg/eclipse/jgit/errors/NotSupportedException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->cannotReadFile:Ljava/lang/String;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p0, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/eclipse/jgit/errors/NotSupportedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public close()V
    .locals 0

    .prologue
    .line 213
    return-void
.end method

.method public openFetch()Lorg/eclipse/jgit/transport/FetchConnection;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 196
    new-instance v0, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3;->bucket:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3;->keyPrefix:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/objects"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, p0, v2, v3}, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;-><init>(Lorg/eclipse/jgit/transport/TransportAmazonS3;Ljava/lang/String;Ljava/lang/String;)V

    .line 197
    .local v0, c:Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;
    new-instance v1, Lorg/eclipse/jgit/transport/WalkFetchConnection;

    invoke-direct {v1, p0, v0}, Lorg/eclipse/jgit/transport/WalkFetchConnection;-><init>(Lorg/eclipse/jgit/transport/WalkTransport;Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;)V

    .line 198
    .local v1, r:Lorg/eclipse/jgit/transport/WalkFetchConnection;
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->readAdvertisedRefs()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->available(Ljava/util/Map;)V

    .line 199
    return-object v1
.end method

.method public openPush()Lorg/eclipse/jgit/transport/PushConnection;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 204
    new-instance v0, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3;->bucket:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lorg/eclipse/jgit/transport/TransportAmazonS3;->keyPrefix:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/objects"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, p0, v2, v3}, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;-><init>(Lorg/eclipse/jgit/transport/TransportAmazonS3;Ljava/lang/String;Ljava/lang/String;)V

    .line 205
    .local v0, c:Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;
    new-instance v1, Lorg/eclipse/jgit/transport/WalkPushConnection;

    invoke-direct {v1, p0, v0}, Lorg/eclipse/jgit/transport/WalkPushConnection;-><init>(Lorg/eclipse/jgit/transport/WalkTransport;Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;)V

    .line 206
    .local v1, r:Lorg/eclipse/jgit/transport/WalkPushConnection;
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/TransportAmazonS3$DatabaseS3;->readAdvertisedRefs()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/transport/WalkPushConnection;->available(Ljava/util/Map;)V

    .line 207
    return-object v1
.end method
