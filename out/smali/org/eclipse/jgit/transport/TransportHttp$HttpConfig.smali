.class Lorg/eclipse/jgit/transport/TransportHttp$HttpConfig;
.super Ljava/lang/Object;
.source "TransportHttp.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/TransportHttp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "HttpConfig"
.end annotation


# instance fields
.field final postBuffer:I

.field final sslVerify:Z


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 235
    new-instance v0, Lorg/eclipse/jgit/lib/Config;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/Config;-><init>()V

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/transport/TransportHttp$HttpConfig;-><init>(Lorg/eclipse/jgit/lib/Config;)V

    .line 236
    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/lib/Config;)V
    .locals 3
    .parameter "rc"

    .prologue
    .line 229
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 230
    const-string v0, "http"

    const-string v1, "postbuffer"

    const/high16 v2, 0x10

    invoke-virtual {p1, v0, v1, v2}, Lorg/eclipse/jgit/lib/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$HttpConfig;->postBuffer:I

    .line 231
    const-string v0, "http"

    const-string v1, "sslVerify"

    const/4 v2, 0x1

    invoke-virtual {p1, v0, v1, v2}, Lorg/eclipse/jgit/lib/Config;->getBoolean(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$HttpConfig;->sslVerify:Z

    .line 232
    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/transport/TransportHttp$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 224
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/TransportHttp$HttpConfig;-><init>()V

    return-void
.end method
