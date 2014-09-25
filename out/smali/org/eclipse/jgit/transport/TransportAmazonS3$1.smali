.class final Lorg/eclipse/jgit/transport/TransportAmazonS3$1;
.super Lorg/eclipse/jgit/transport/TransportProtocol;
.source "TransportAmazonS3.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/TransportAmazonS3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 103
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/TransportProtocol;-><init>()V

    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 105
    const-string v0, "Amazon S3"

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
    .line 118
    sget-object v0, Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;->PASS:Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;

    invoke-static {v0}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getRequiredFields()Ljava/util/Set;
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
    .line 113
    sget-object v0, Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;->USER:Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;

    sget-object v1, Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;->HOST:Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;

    sget-object v2, Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;->PATH:Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;

    invoke-static {v0, v1, v2}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

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
    .line 109
    const-string v0, "amazon-s3"

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
    .line 123
    new-instance v0, Lorg/eclipse/jgit/transport/TransportAmazonS3;

    invoke-direct {v0, p2, p1}, Lorg/eclipse/jgit/transport/TransportAmazonS3;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;)V

    return-object v0
.end method
