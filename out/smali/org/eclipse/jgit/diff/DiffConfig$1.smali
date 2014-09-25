.class final Lorg/eclipse/jgit/diff/DiffConfig$1;
.super Ljava/lang/Object;
.source "DiffConfig.java"

# interfaces
.implements Lorg/eclipse/jgit/lib/Config$SectionParser;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/diff/DiffConfig;
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
        "Lorg/eclipse/jgit/diff/DiffConfig;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic parse(Lorg/eclipse/jgit/lib/Config;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 57
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/diff/DiffConfig$1;->parse(Lorg/eclipse/jgit/lib/Config;)Lorg/eclipse/jgit/diff/DiffConfig;

    move-result-object v0

    return-object v0
.end method

.method public parse(Lorg/eclipse/jgit/lib/Config;)Lorg/eclipse/jgit/diff/DiffConfig;
    .locals 2
    .parameter "cfg"

    .prologue
    .line 59
    new-instance v0, Lorg/eclipse/jgit/diff/DiffConfig;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lorg/eclipse/jgit/diff/DiffConfig;-><init>(Lorg/eclipse/jgit/lib/Config;Lorg/eclipse/jgit/diff/DiffConfig$1;)V

    return-object v0
.end method
