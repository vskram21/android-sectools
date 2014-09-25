.class public abstract Lorg/eclipse/jgit/transport/HttpTransport;
.super Lorg/eclipse/jgit/transport/Transport;
.source "HttpTransport.java"


# static fields
.field protected static connectionFactory:Lorg/eclipse/jgit/transport/http/HttpConnectionFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 62
    new-instance v0, Lorg/eclipse/jgit/transport/http/JDKHttpConnectionFactory;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/http/JDKHttpConnectionFactory;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/transport/HttpTransport;->connectionFactory:Lorg/eclipse/jgit/transport/http/HttpConnectionFactory;

    return-void
.end method

.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;)V
    .locals 0
    .parameter "local"
    .parameter "uri"

    .prologue
    .line 95
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/transport/Transport;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;)V

    .line 96
    return-void
.end method

.method protected constructor <init>(Lorg/eclipse/jgit/transport/URIish;)V
    .locals 0
    .parameter "uri"

    .prologue
    .line 104
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/Transport;-><init>(Lorg/eclipse/jgit/transport/URIish;)V

    .line 105
    return-void
.end method

.method public static getConnectionFactory()Lorg/eclipse/jgit/transport/http/HttpConnectionFactory;
    .locals 1

    .prologue
    .line 69
    sget-object v0, Lorg/eclipse/jgit/transport/HttpTransport;->connectionFactory:Lorg/eclipse/jgit/transport/http/HttpConnectionFactory;

    return-object v0
.end method

.method public static setConnectionFactory(Lorg/eclipse/jgit/transport/http/HttpConnectionFactory;)V
    .locals 0
    .parameter "cf"

    .prologue
    .line 80
    sput-object p0, Lorg/eclipse/jgit/transport/HttpTransport;->connectionFactory:Lorg/eclipse/jgit/transport/http/HttpConnectionFactory;

    .line 81
    return-void
.end method
