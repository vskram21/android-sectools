.class final Lorg/eclipse/jgit/lib/UserConfig$1;
.super Ljava/lang/Object;
.source "UserConfig.java"

# interfaces
.implements Lorg/eclipse/jgit/lib/Config$SectionParser;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/lib/UserConfig;
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
        "Lorg/eclipse/jgit/lib/UserConfig;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic parse(Lorg/eclipse/jgit/lib/Config;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 54
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/lib/UserConfig$1;->parse(Lorg/eclipse/jgit/lib/Config;)Lorg/eclipse/jgit/lib/UserConfig;

    move-result-object v0

    return-object v0
.end method

.method public parse(Lorg/eclipse/jgit/lib/Config;)Lorg/eclipse/jgit/lib/UserConfig;
    .locals 2
    .parameter "cfg"

    .prologue
    .line 56
    new-instance v0, Lorg/eclipse/jgit/lib/UserConfig;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lorg/eclipse/jgit/lib/UserConfig;-><init>(Lorg/eclipse/jgit/lib/Config;Lorg/eclipse/jgit/lib/UserConfig$1;)V

    return-object v0
.end method
