.class final Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;
.super Ljava/lang/Object;
.source "DfsPackKey.java"


# instance fields
.field final cachedSize:Ljava/util/concurrent/atomic/AtomicLong;

.field final hash:I


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;->hash:I

    .line 58
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;->cachedSize:Ljava/util/concurrent/atomic/AtomicLong;

    .line 59
    return-void
.end method
