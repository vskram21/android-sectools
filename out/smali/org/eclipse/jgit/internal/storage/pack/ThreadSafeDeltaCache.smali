.class Lorg/eclipse/jgit/internal/storage/pack/ThreadSafeDeltaCache;
.super Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;
.source "ThreadSafeDeltaCache.java"


# instance fields
.field private final lock:Ljava/util/concurrent/locks/ReentrantLock;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/storage/pack/PackConfig;)V
    .locals 1
    .parameter "pc"

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;-><init>(Lorg/eclipse/jgit/storage/pack/PackConfig;)V

    .line 55
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ThreadSafeDeltaCache;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 56
    return-void
.end method


# virtual methods
.method cache([BII)Lorg/eclipse/jgit/internal/storage/pack/DeltaCache$Ref;
    .locals 2
    .parameter "data"
    .parameter "actLen"
    .parameter "reservedSize"

    .prologue
    .line 80
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/pack/ThreadSafeDeltaCache;->resize([BI)[B

    move-result-object p1

    .line 81
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ThreadSafeDeltaCache;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 83
    :try_start_0
    invoke-super {p0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->cache([BII)Lorg/eclipse/jgit/internal/storage/pack/DeltaCache$Ref;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 85
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/ThreadSafeDeltaCache;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 83
    return-object v0

    .line 85
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/ThreadSafeDeltaCache;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0
.end method

.method canCache(ILorg/eclipse/jgit/internal/storage/pack/ObjectToPack;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)Z
    .locals 2
    .parameter "length"
    .parameter "src"
    .parameter "res"

    .prologue
    .line 60
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ThreadSafeDeltaCache;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 62
    :try_start_0
    invoke-super {p0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->canCache(ILorg/eclipse/jgit/internal/storage/pack/ObjectToPack;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 64
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/ThreadSafeDeltaCache;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 62
    return v0

    .line 64
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/ThreadSafeDeltaCache;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0
.end method

.method credit(I)V
    .locals 2
    .parameter "reservedSize"

    .prologue
    .line 70
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ThreadSafeDeltaCache;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 72
    :try_start_0
    invoke-super {p0, p1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;->credit(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/ThreadSafeDeltaCache;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 76
    return-void

    .line 74
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/ThreadSafeDeltaCache;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0
.end method
