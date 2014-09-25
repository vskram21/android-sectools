.class final Lorg/eclipse/jgit/transport/TransportHttp$3;
.super Ljava/lang/Object;
.source "TransportHttp.java"

# interfaces
.implements Lorg/eclipse/jgit/lib/Config$SectionParser;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/TransportHttp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/eclipse/jgit/lib/Config$SectionParser",
        "<",
        "Lorg/eclipse/jgit/transport/TransportHttp$HttpConfig;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 218
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic parse(Lorg/eclipse/jgit/lib/Config;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 218
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/transport/TransportHttp$3;->parse(Lorg/eclipse/jgit/lib/Config;)Lorg/eclipse/jgit/transport/TransportHttp$HttpConfig;

    move-result-object v0

    return-object v0
.end method

.method public parse(Lorg/eclipse/jgit/lib/Config;)Lorg/eclipse/jgit/transport/TransportHttp$HttpConfig;
    .locals 1
    .parameter "cfg"

    .prologue
    .line 220
    new-instance v0, Lorg/eclipse/jgit/transport/TransportHttp$HttpConfig;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/transport/TransportHttp$HttpConfig;-><init>(Lorg/eclipse/jgit/lib/Config;)V

    return-object v0
.end method
