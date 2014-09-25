.class final Lorg/eclipse/jgit/transport/TransportGitAnon$1;
.super Lorg/eclipse/jgit/transport/TransportProtocol;
.source "TransportGitAnon.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/TransportGitAnon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 77
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/TransportProtocol;-><init>()V

    return-void
.end method


# virtual methods
.method public getDefaultPort()I
    .locals 1

    .prologue
    .line 96
    const/16 v0, 0x24ca

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 79
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->transportProtoGitAnon:Ljava/lang/String;

    return-object v0
.end method

.method public getOptionalFields()Ljava/util/Set;
    .locals 1
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
    .line 92
    sget-object v0, Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;->PORT:Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;

    invoke-static {v0}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

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
    .line 87
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
    .line 83
    const-string v0, "git"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

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
    .line 101
    new-instance v0, Lorg/eclipse/jgit/transport/TransportGitAnon;

    invoke-direct {v0, p2, p1}, Lorg/eclipse/jgit/transport/TransportGitAnon;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;)V

    return-object v0
.end method
