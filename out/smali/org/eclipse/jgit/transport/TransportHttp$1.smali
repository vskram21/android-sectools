.class final Lorg/eclipse/jgit/transport/TransportHttp$1;
.super Lorg/eclipse/jgit/transport/TransportProtocol;
.source "TransportHttp.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/TransportHttp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field private final schemeNames:[Ljava/lang/String;

.field private final schemeSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 3

    .prologue
    .line 139
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/TransportProtocol;-><init>()V

    .line 140
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "http"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "https"

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$1;->schemeNames:[Ljava/lang/String;

    .line 142
    new-instance v0, Ljava/util/LinkedHashSet;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportHttp$1;->schemeNames:[Ljava/lang/String;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$1;->schemeSet:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public getDefaultPort()I
    .locals 1

    .prologue
    .line 165
    const/16 v0, 0x50

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 147
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->transportProtoHTTP:Ljava/lang/String;

    return-object v0
.end method

.method public getOptionalFields()Ljava/util/Set;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;",
            ">;"
        }
    .end annotation

    .prologue
    .line 160
    sget-object v0, Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;->USER:Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;

    sget-object v1, Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;->PASS:Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;

    sget-object v2, Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;->PORT:Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;

    invoke-static {v0, v1, v2}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getRequiredFields()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;",
            ">;"
        }
    .end annotation

    .prologue
    .line 155
    sget-object v0, Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;->HOST:Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;

    sget-object v1, Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;->PATH:Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;

    invoke-static {v0, v1}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getSchemes()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 151
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$1;->schemeSet:Ljava/util/Set;

    return-object v0
.end method

.method public open(Lorg/eclipse/jgit/transport/URIish;)Lorg/eclipse/jgit/transport/Transport;
    .locals 1
    .parameter "uri"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;
        }
    .end annotation

    .prologue
    .line 174
    new-instance v0, Lorg/eclipse/jgit/transport/TransportHttp;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/transport/TransportHttp;-><init>(Lorg/eclipse/jgit/transport/URIish;)V

    return-object v0
.end method

.method public open(Lorg/eclipse/jgit/transport/URIish;Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;)Lorg/eclipse/jgit/transport/Transport;
    .locals 1
    .parameter "uri"
    .parameter "local"
    .parameter "remoteName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;
        }
    .end annotation

    .prologue
    .line 170
    new-instance v0, Lorg/eclipse/jgit/transport/TransportHttp;

    invoke-direct {v0, p2, p1}, Lorg/eclipse/jgit/transport/TransportHttp;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;)V

    return-object v0
.end method
