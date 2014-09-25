.class final Lorg/eclipse/jgit/internal/storage/dfs/DfsConfig;
.super Lorg/eclipse/jgit/lib/StoredConfig;
.source "DfsConfig.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 51
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/StoredConfig;-><init>()V

    return-void
.end method


# virtual methods
.method public load()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/ConfigInvalidException;
        }
    .end annotation

    .prologue
    .line 54
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsConfig;->clear()V

    .line 55
    return-void
.end method

.method public save()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 60
    return-void
.end method
