.class public Lorg/eclipse/jgit/transport/TransportGitSsh;
.super Lorg/eclipse/jgit/transport/SshTransport;
.source "TransportGitSsh.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/PackTransport;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/transport/TransportGitSsh$ExtSession;,
        Lorg/eclipse/jgit/transport/TransportGitSsh$SshFetchConnection;,
        Lorg/eclipse/jgit/transport/TransportGitSsh$SshPushConnection;
    }
.end annotation


# static fields
.field static final PROTO_SSH:Lorg/eclipse/jgit/transport/TransportProtocol;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 84
    new-instance v0, Lorg/eclipse/jgit/transport/TransportGitSsh$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/TransportGitSsh$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/transport/TransportGitSsh;->PROTO_SSH:Lorg/eclipse/jgit/transport/TransportProtocol;

    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;)V
    .locals 1
    .parameter "local"
    .parameter "uri"

    .prologue
    .line 132
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/transport/SshTransport;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;)V

    .line 133
    invoke-static {}, Lorg/eclipse/jgit/transport/TransportGitSsh;->useExtSession()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 134
    new-instance v0, Lorg/eclipse/jgit/transport/TransportGitSsh$2;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/transport/TransportGitSsh$2;-><init>(Lorg/eclipse/jgit/transport/TransportGitSsh;)V

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/TransportGitSsh;->setSshSessionFactory(Lorg/eclipse/jgit/transport/SshSessionFactory;)V

    .line 143
    :cond_0
    return-void
.end method

.method private static useExtSession()Z
    .locals 2

    .prologue
    .line 198
    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v0

    const-string v1, "GIT_SSH"

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/util/SystemReader;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method checkExecFailure(ILjava/lang/String;Ljava/lang/String;)V
    .locals 7
    .parameter "status"
    .parameter "exe"
    .parameter "why"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 169
    const/16 v1, 0x7f

    if-ne p1, v1, :cond_1

    .line 170
    const/4 v0, 0x0

    .line 171
    .local v0, cause:Ljava/io/IOException;
    if-eqz p3, :cond_0

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 172
    new-instance v0, Ljava/io/IOException;

    .end local v0           #cause:Ljava/io/IOException;
    invoke-direct {v0, p3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 173
    .restart local v0       #cause:Ljava/io/IOException;
    :cond_0
    new-instance v1, Lorg/eclipse/jgit/errors/TransportException;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportGitSsh;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->cannotExecute:Ljava/lang/String;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/transport/TransportGitSsh;->commandFor(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 176
    .end local v0           #cause:Ljava/io/IOException;
    :cond_1
    return-void
.end method

.method cleanNotFound(Lorg/eclipse/jgit/errors/NoRemoteRepositoryException;Ljava/lang/String;)Lorg/eclipse/jgit/errors/NoRemoteRepositoryException;
    .locals 4
    .parameter "nf"
    .parameter "why"

    .prologue
    .line 180
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1

    .line 194
    .end local p1
    :cond_0
    :goto_0
    return-object p1

    .line 183
    .restart local p1
    :cond_1
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportGitSsh;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/URIish;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 184
    .local v0, path:Ljava/lang/String;
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportGitSsh;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/URIish;->getScheme()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportGitSsh;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/URIish;->getPath()Ljava/lang/String;

    move-result-object v2

    const-string v3, "/~"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 185
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportGitSsh;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/URIish;->getPath()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 187
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 188
    .local v1, pfx:Ljava/lang/StringBuilder;
    const-string v2, "fatal: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    sget-object v2, Lorg/eclipse/jgit/util/QuotedString;->BOURNE:Lorg/eclipse/jgit/util/QuotedString$BourneStyle;

    invoke-virtual {v2, v0}, Lorg/eclipse/jgit/util/QuotedString$BourneStyle;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 192
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    invoke-virtual {p2, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    .line 194
    :cond_3
    new-instance p1, Lorg/eclipse/jgit/errors/NoRemoteRepositoryException;

    .end local p1
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportGitSsh;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-direct {p1, v2, p2}, Lorg/eclipse/jgit/errors/NoRemoteRepositoryException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    goto :goto_0
.end method

.method commandFor(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "exe"

    .prologue
    .line 156
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportGitSsh;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/URIish;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 157
    .local v1, path:Ljava/lang/String;
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportGitSsh;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/URIish;->getScheme()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportGitSsh;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/URIish;->getPath()Ljava/lang/String;

    move-result-object v2

    const-string v3, "/~"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 158
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportGitSsh;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/URIish;->getPath()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 160
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 161
    .local v0, cmd:Ljava/lang/StringBuilder;
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    const/16 v2, 0x20

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 163
    sget-object v2, Lorg/eclipse/jgit/util/QuotedString;->BOURNE:Lorg/eclipse/jgit/util/QuotedString$BourneStyle;

    invoke-virtual {v2, v1}, Lorg/eclipse/jgit/util/QuotedString$BourneStyle;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public openFetch()Lorg/eclipse/jgit/transport/FetchConnection;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 147
    new-instance v0, Lorg/eclipse/jgit/transport/TransportGitSsh$SshFetchConnection;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/transport/TransportGitSsh$SshFetchConnection;-><init>(Lorg/eclipse/jgit/transport/TransportGitSsh;)V

    return-object v0
.end method

.method public openPush()Lorg/eclipse/jgit/transport/PushConnection;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 152
    new-instance v0, Lorg/eclipse/jgit/transport/TransportGitSsh$SshPushConnection;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/transport/TransportGitSsh$SshPushConnection;-><init>(Lorg/eclipse/jgit/transport/TransportGitSsh;)V

    return-object v0
.end method
