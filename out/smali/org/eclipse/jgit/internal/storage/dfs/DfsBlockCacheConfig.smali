.class public Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCacheConfig;
.super Ljava/lang/Object;
.source "DfsBlockCacheConfig.java"


# static fields
.field public static final KB:I = 0x400

.field public static final MB:I = 0x100000


# instance fields
.field private blockLimit:J

.field private blockSize:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    const-wide/32 v0, 0x2000000

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCacheConfig;->setBlockLimit(J)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCacheConfig;

    .line 68
    const/high16 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCacheConfig;->setBlockSize(I)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCacheConfig;

    .line 69
    return-void
.end method


# virtual methods
.method public fromConfig(Lorg/eclipse/jgit/lib/Config;)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCacheConfig;
    .locals 6
    .parameter "rc"

    .prologue
    .line 119
    const-string v1, "core"

    const-string v2, "dfs"

    const-string v3, "blockLimit"

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCacheConfig;->getBlockLimit()J

    move-result-wide v4

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/jgit/lib/Config;->getLong(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCacheConfig;->setBlockLimit(J)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCacheConfig;

    .line 125
    const-string v0, "core"

    const-string v1, "dfs"

    const-string v2, "blockSize"

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCacheConfig;->getBlockSize()I

    move-result v3

    invoke-virtual {p1, v0, v1, v2, v3}, Lorg/eclipse/jgit/lib/Config;->getInt(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCacheConfig;->setBlockSize(I)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCacheConfig;

    .line 130
    return-object p0
.end method

.method public getBlockLimit()J
    .locals 2

    .prologue
    .line 76
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCacheConfig;->blockLimit:J

    return-wide v0
.end method

.method public getBlockSize()I
    .locals 1

    .prologue
    .line 95
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCacheConfig;->blockSize:I

    return v0
.end method

.method public setBlockLimit(J)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCacheConfig;
    .locals 0
    .parameter "newLimit"

    .prologue
    .line 86
    iput-wide p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCacheConfig;->blockLimit:J

    .line 87
    return-object p0
.end method

.method public setBlockSize(I)Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCacheConfig;
    .locals 1
    .parameter "newSize"

    .prologue
    .line 104
    const/16 v0, 0x200

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCacheConfig;->blockSize:I

    .line 105
    return-object p0
.end method
