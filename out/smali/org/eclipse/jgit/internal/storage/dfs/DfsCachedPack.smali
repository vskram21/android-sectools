.class public Lorg/eclipse/jgit/internal/storage/dfs/DfsCachedPack;
.super Lorg/eclipse/jgit/internal/storage/pack/CachedPack;
.source "DfsCachedPack.java"


# instance fields
.field private final pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;)V
    .locals 0
    .parameter "pack"

    .prologue
    .line 57
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/pack/CachedPack;-><init>()V

    .line 58
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsCachedPack;->pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    .line 59
    return-void
.end method


# virtual methods
.method copyAsIs(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;ZLorg/eclipse/jgit/internal/storage/dfs/DfsReader;)V
    .locals 1
    .parameter "out"
    .parameter "validate"
    .parameter "ctx"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 83
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsCachedPack;->pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    invoke-virtual {v0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->copyPackAsIs(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;ZLorg/eclipse/jgit/internal/storage/dfs/DfsReader;)V

    .line 84
    return-void
.end method

.method public getDeltaCount()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 73
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsCachedPack;->getPackDescription()Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->getDeltaCount()J

    move-result-wide v0

    return-wide v0
.end method

.method public getObjectCount()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 68
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsCachedPack;->getPackDescription()Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->getObjectCount()J

    move-result-wide v0

    return-wide v0
.end method

.method public getPackDescription()Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsCachedPack;->pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getPackDescription()Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    move-result-object v0

    return-object v0
.end method

.method public hasObject(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;Lorg/eclipse/jgit/internal/storage/pack/StoredObjectRepresentation;)Z
    .locals 2
    .parameter "obj"
    .parameter "rep"

    .prologue
    .line 78
    check-cast p2, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;

    .end local p2
    iget-object v0, p2, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;->pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsCachedPack;->pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
