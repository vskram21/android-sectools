.class public abstract Lorg/eclipse/jgit/transport/CredentialsProvider;
.super Ljava/lang/Object;
.source "CredentialsProvider.java"


# static fields
.field private static volatile defaultProvider:Lorg/eclipse/jgit/transport/CredentialsProvider;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDefault()Lorg/eclipse/jgit/transport/CredentialsProvider;
    .locals 1

    .prologue
    .line 70
    sget-object v0, Lorg/eclipse/jgit/transport/CredentialsProvider;->defaultProvider:Lorg/eclipse/jgit/transport/CredentialsProvider;

    return-object v0
.end method

.method public static setDefault(Lorg/eclipse/jgit/transport/CredentialsProvider;)V
    .locals 0
    .parameter "p"

    .prologue
    .line 80
    sput-object p0, Lorg/eclipse/jgit/transport/CredentialsProvider;->defaultProvider:Lorg/eclipse/jgit/transport/CredentialsProvider;

    .line 81
    return-void
.end method


# virtual methods
.method public get(Lorg/eclipse/jgit/transport/URIish;Ljava/util/List;)Z
    .locals 1
    .parameter "uri"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/transport/URIish;",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/CredentialItem;",
            ">;)Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/UnsupportedCredentialItem;
        }
    .end annotation

    .prologue
    .line 135
    .local p2, items:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/CredentialItem;>;"
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Lorg/eclipse/jgit/transport/CredentialItem;

    invoke-interface {p2, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/transport/CredentialItem;

    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/transport/CredentialsProvider;->get(Lorg/eclipse/jgit/transport/URIish;[Lorg/eclipse/jgit/transport/CredentialItem;)Z

    move-result v0

    return v0
.end method

.method public varargs abstract get(Lorg/eclipse/jgit/transport/URIish;[Lorg/eclipse/jgit/transport/CredentialItem;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/UnsupportedCredentialItem;
        }
    .end annotation
.end method

.method public abstract isInteractive()Z
.end method

.method public reset(Lorg/eclipse/jgit/transport/URIish;)V
    .locals 0
    .parameter "uri"

    .prologue
    .line 145
    return-void
.end method

.method public varargs abstract supports([Lorg/eclipse/jgit/transport/CredentialItem;)Z
.end method
