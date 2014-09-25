.class public abstract Lorg/eclipse/jgit/lib/StoredConfig;
.super Lorg/eclipse/jgit/lib/Config;
.source "StoredConfig.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 56
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/Config;-><init>()V

    .line 57
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Config;)V
    .locals 0
    .parameter "defaultConfig"

    .prologue
    .line 67
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/lib/Config;-><init>(Lorg/eclipse/jgit/lib/Config;)V

    .line 68
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 0

    .prologue
    .line 93
    invoke-super {p0}, Lorg/eclipse/jgit/lib/Config;->clear()V

    .line 94
    return-void
.end method

.method public abstract load()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/ConfigInvalidException;
        }
    .end annotation
.end method

.method public abstract save()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
