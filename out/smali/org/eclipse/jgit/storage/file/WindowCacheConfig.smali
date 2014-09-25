.class public Lorg/eclipse/jgit/storage/file/WindowCacheConfig;
.super Ljava/lang/Object;
.source "WindowCacheConfig.java"


# static fields
.field public static final KB:I = 0x400

.field public static final MB:I = 0x100000


# instance fields
.field private deltaBaseCacheLimit:I

.field private packedGitLimit:J

.field private packedGitMMAP:Z

.field private packedGitOpenFiles:I

.field private packedGitWindowSize:I

.field private streamFileThreshold:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    const/16 v0, 0x80

    iput v0, p0, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->packedGitOpenFiles:I

    .line 73
    const-wide/32 v0, 0xa00000

    iput-wide v0, p0, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->packedGitLimit:J

    .line 74
    const/16 v0, 0x2000

    iput v0, p0, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->packedGitWindowSize:I

    .line 75
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->packedGitMMAP:Z

    .line 76
    const/high16 v0, 0xa0

    iput v0, p0, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->deltaBaseCacheLimit:I

    .line 77
    const/high16 v0, 0x320

    iput v0, p0, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->streamFileThreshold:I

    .line 78
    return-void
.end method


# virtual methods
.method public fromConfig(Lorg/eclipse/jgit/lib/Config;)Lorg/eclipse/jgit/storage/file/WindowCacheConfig;
    .locals 10
    .parameter "rc"

    .prologue
    const/4 v2, 0x0

    .line 195
    const-string v0, "core"

    const-string v1, "packedgitopenfiles"

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->getPackedGitOpenFiles()I

    move-result v3

    invoke-virtual {p1, v0, v2, v1, v3}, Lorg/eclipse/jgit/lib/Config;->getInt(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->setPackedGitOpenFiles(I)V

    .line 197
    const-string v1, "core"

    const-string v3, "packedgitlimit"

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->getPackedGitLimit()J

    move-result-wide v4

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/jgit/lib/Config;->getLong(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->setPackedGitLimit(J)V

    .line 199
    const-string v0, "core"

    const-string v1, "packedgitwindowsize"

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->getPackedGitWindowSize()I

    move-result v3

    invoke-virtual {p1, v0, v2, v1, v3}, Lorg/eclipse/jgit/lib/Config;->getInt(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->setPackedGitWindowSize(I)V

    .line 201
    const-string v0, "core"

    const-string v1, "packedgitmmap"

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->isPackedGitMMAP()Z

    move-result v3

    invoke-virtual {p1, v0, v2, v1, v3}, Lorg/eclipse/jgit/lib/Config;->getBoolean(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->setPackedGitMMAP(Z)V

    .line 203
    const-string v0, "core"

    const-string v1, "deltabasecachelimit"

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->getDeltaBaseCacheLimit()I

    move-result v3

    invoke-virtual {p1, v0, v2, v1, v3}, Lorg/eclipse/jgit/lib/Config;->getInt(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->setDeltaBaseCacheLimit(I)V

    .line 206
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->maxMemory()J

    move-result-wide v6

    .line 207
    .local v6, maxMem:J
    const-string v1, "core"

    const-string v3, "streamfilethreshold"

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->getStreamFileThreshold()I

    move-result v0

    int-to-long v4, v0

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/jgit/lib/Config;->getLong(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)J

    move-result-wide v8

    .line 209
    .local v8, sft:J
    const-wide/16 v0, 0x4

    div-long v0, v6, v0

    invoke-static {v8, v9, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    .line 210
    const-wide/32 v0, 0x7fffffff

    invoke-static {v8, v9, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    .line 211
    long-to-int v0, v8

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->setStreamFileThreshold(I)V

    .line 212
    return-object p0
.end method

.method public getDeltaBaseCacheLimit()I
    .locals 1

    .prologue
    .line 155
    iget v0, p0, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->deltaBaseCacheLimit:I

    return v0
.end method

.method public getPackedGitLimit()J
    .locals 2

    .prologue
    .line 102
    iget-wide v0, p0, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->packedGitLimit:J

    return-wide v0
.end method

.method public getPackedGitOpenFiles()I
    .locals 1

    .prologue
    .line 85
    iget v0, p0, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->packedGitOpenFiles:I

    return v0
.end method

.method public getPackedGitWindowSize()I
    .locals 1

    .prologue
    .line 119
    iget v0, p0, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->packedGitWindowSize:I

    return v0
.end method

.method public getStreamFileThreshold()I
    .locals 1

    .prologue
    .line 169
    iget v0, p0, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->streamFileThreshold:I

    return v0
.end method

.method public install()V
    .locals 0

    .prologue
    .line 225
    invoke-static {p0}, Lorg/eclipse/jgit/internal/storage/file/WindowCache;->reconfigure(Lorg/eclipse/jgit/storage/file/WindowCacheConfig;)V

    .line 226
    return-void
.end method

.method public isPackedGitMMAP()Z
    .locals 1

    .prologue
    .line 136
    iget-boolean v0, p0, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->packedGitMMAP:Z

    return v0
.end method

.method public setDeltaBaseCacheLimit(I)V
    .locals 0
    .parameter "newLimit"

    .prologue
    .line 164
    iput p1, p0, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->deltaBaseCacheLimit:I

    .line 165
    return-void
.end method

.method public setPackedGitLimit(J)V
    .locals 0
    .parameter "newLimit"

    .prologue
    .line 111
    iput-wide p1, p0, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->packedGitLimit:J

    .line 112
    return-void
.end method

.method public setPackedGitMMAP(Z)V
    .locals 0
    .parameter "usemmap"

    .prologue
    .line 146
    iput-boolean p1, p0, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->packedGitMMAP:Z

    .line 147
    return-void
.end method

.method public setPackedGitOpenFiles(I)V
    .locals 0
    .parameter "fdLimit"

    .prologue
    .line 94
    iput p1, p0, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->packedGitOpenFiles:I

    .line 95
    return-void
.end method

.method public setPackedGitWindowSize(I)V
    .locals 0
    .parameter "newSize"

    .prologue
    .line 127
    iput p1, p0, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->packedGitWindowSize:I

    .line 128
    return-void
.end method

.method public setStreamFileThreshold(I)V
    .locals 0
    .parameter "newLimit"

    .prologue
    .line 180
    iput p1, p0, Lorg/eclipse/jgit/storage/file/WindowCacheConfig;->streamFileThreshold:I

    .line 181
    return-void
.end method
