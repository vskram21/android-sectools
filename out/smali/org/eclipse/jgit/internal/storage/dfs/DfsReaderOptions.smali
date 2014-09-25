.class public Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;
.super Ljava/lang/Object;
.source "DfsReaderOptions.java"


# static fields
.field public static final KiB:I = 0x400

.field public static final MiB:I = 0x100000


# instance fields
.field private deltaBaseCacheLimit:I

.field private streamFileThreshold:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    const/high16 v0, 0xa0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;->setDeltaBaseCacheLimit(I)Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;

    .line 69
    const/high16 v0, 0x320

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;->setStreamFileThreshold(I)Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;

    .line 70
    return-void
.end method


# virtual methods
.method public fromConfig(Lorg/eclipse/jgit/lib/Config;)Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;
    .locals 10
    .parameter "rc"

    .prologue
    .line 118
    const-string v0, "core"

    const-string v1, "dfs"

    const-string v2, "deltaBaseCacheLimit"

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;->getDeltaBaseCacheLimit()I

    move-result v3

    invoke-virtual {p1, v0, v1, v2, v3}, Lorg/eclipse/jgit/lib/Config;->getInt(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;->setDeltaBaseCacheLimit(I)Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;

    .line 124
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->maxMemory()J

    move-result-wide v6

    .line 125
    .local v6, maxMem:J
    const-string v1, "core"

    const-string v2, "dfs"

    const-string v3, "streamFileThreshold"

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;->getStreamFileThreshold()I

    move-result v0

    int-to-long v4, v0

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/jgit/lib/Config;->getLong(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)J

    move-result-wide v8

    .line 130
    .local v8, sft:J
    const-wide/16 v0, 0x4

    div-long v0, v6, v0

    invoke-static {v8, v9, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    .line 131
    const-wide/32 v0, 0x7fffffff

    invoke-static {v8, v9, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    .line 132
    long-to-int v0, v8

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;->setStreamFileThreshold(I)Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;

    .line 133
    return-object p0
.end method

.method public getDeltaBaseCacheLimit()I
    .locals 1

    .prologue
    .line 74
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;->deltaBaseCacheLimit:I

    return v0
.end method

.method public getStreamFileThreshold()I
    .locals 1

    .prologue
    .line 91
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;->streamFileThreshold:I

    return v0
.end method

.method public setDeltaBaseCacheLimit(I)Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;
    .locals 1
    .parameter "maxBytes"

    .prologue
    .line 85
    const/4 v0, 0x0

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;->deltaBaseCacheLimit:I

    .line 86
    return-object p0
.end method

.method public setStreamFileThreshold(I)Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;
    .locals 1
    .parameter "newLimit"

    .prologue
    .line 103
    const/4 v0, 0x0

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;->streamFileThreshold:I

    .line 104
    return-object p0
.end method
