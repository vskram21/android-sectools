.class final Lorg/eclipse/jgit/transport/TransportSftp$1;
.super Lorg/eclipse/jgit/transport/TransportProtocol;
.source "TransportSftp.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/TransportSftp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 100
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/TransportProtocol;-><init>()V

    return-void
.end method


# virtual methods
.method public getDefaultPort()I
    .locals 1

    .prologue
    .line 120
    const/16 v0, 0x16

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 102
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->transportProtoSFTP:Ljava/lang/String;

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
    .line 115
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
    .line 110
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
    .line 106
    const-string v0, "sftp"

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
    .line 125
    new-instance v0, Lorg/eclipse/jgit/transport/TransportSftp;

    invoke-direct {v0, p2, p1}, Lorg/eclipse/jgit/transport/TransportSftp;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;)V

    return-object v0
.end method
