.class final Lorg/eclipse/jgit/transport/BasePackFetchConnection$FetchConfig$1;
.super Ljava/lang/Object;
.source "BasePackFetchConnection.java"

# interfaces
.implements Lorg/eclipse/jgit/lib/Config$SectionParser;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/BasePackFetchConnection$FetchConfig;
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
        "Lorg/eclipse/jgit/transport/BasePackFetchConnection$FetchConfig;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 275
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic parse(Lorg/eclipse/jgit/lib/Config;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 275
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/transport/BasePackFetchConnection$FetchConfig$1;->parse(Lorg/eclipse/jgit/lib/Config;)Lorg/eclipse/jgit/transport/BasePackFetchConnection$FetchConfig;

    move-result-object v0

    return-object v0
.end method

.method public parse(Lorg/eclipse/jgit/lib/Config;)Lorg/eclipse/jgit/transport/BasePackFetchConnection$FetchConfig;
    .locals 1
    .parameter "cfg"

    .prologue
    .line 277
    new-instance v0, Lorg/eclipse/jgit/transport/BasePackFetchConnection$FetchConfig;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/transport/BasePackFetchConnection$FetchConfig;-><init>(Lorg/eclipse/jgit/lib/Config;)V

    return-object v0
.end method
