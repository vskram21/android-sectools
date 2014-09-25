.class Lorg/eclipse/jgit/transport/TransportHttp$DummyHostnameVerifier;
.super Ljava/lang/Object;
.source "TransportHttp.java"

# interfaces
.implements Ljavax/net/ssl/HostnameVerifier;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/TransportHttp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DummyHostnameVerifier"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 1021
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/transport/TransportHttp$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 1021
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/TransportHttp$DummyHostnameVerifier;-><init>()V

    return-void
.end method


# virtual methods
.method public verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z
    .locals 1
    .parameter "hostname"
    .parameter "session"

    .prologue
    .line 1024
    const/4 v0, 0x1

    return v0
.end method
