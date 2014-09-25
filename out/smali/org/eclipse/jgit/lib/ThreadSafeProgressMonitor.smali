.class public Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;
.super Ljava/lang/Object;
.source "ThreadSafeProgressMonitor.java"

# interfaces
.implements Lorg/eclipse/jgit/lib/ProgressMonitor;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final lock:Ljava/util/concurrent/locks/ReentrantLock;

.field private final mainThread:Ljava/lang/Thread;

.field private final pendingUpdates:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

.field private final process:Ljava/util/concurrent/Semaphore;

.field private final workers:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 62
    const-class v0, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    .locals 2
    .parameter "pm"

    .prologue
    const/4 v1, 0x0

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    iput-object p1, p0, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    .line 83
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 84
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->mainThread:Ljava/lang/Thread;

    .line 85
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->workers:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 86
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->pendingUpdates:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 87
    new-instance v0, Ljava/util/concurrent/Semaphore;

    invoke-direct {v0, v1}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->process:Ljava/util/concurrent/Semaphore;

    .line 88
    return-void
.end method

.method private doUpdates()V
    .locals 3

    .prologue
    .line 154
    iget-object v1, p0, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->pendingUpdates:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndSet(I)I

    move-result v0

    .line 155
    .local v0, cnt:I
    if-lez v0, :cond_0

    .line 156
    iget-object v1, p0, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-interface {v1, v0}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    .line 157
    :cond_0
    return-void
.end method

.method private isMainThread()Z
    .locals 2

    .prologue
    .line 180
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->mainThread:Ljava/lang/Thread;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public beginTask(Ljava/lang/String;I)V
    .locals 1
    .parameter "title"
    .parameter "totalWork"

    .prologue
    .line 97
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->isMainThread()Z

    move-result v0

    if-nez v0, :cond_0

    .line 98
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 99
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-interface {v0, p1, p2}, Lorg/eclipse/jgit/lib/ProgressMonitor;->beginTask(Ljava/lang/String;I)V

    .line 100
    return-void
.end method

.method public endTask()V
    .locals 1

    .prologue
    .line 174
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->isMainThread()Z

    move-result v0

    if-nez v0, :cond_0

    .line 175
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 176
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-interface {v0}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    .line 177
    return-void
.end method

.method public endWorker()V
    .locals 1

    .prologue
    .line 119
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->workers:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v0

    if-nez v0, :cond_0

    .line 120
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->process:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 121
    :cond_0
    return-void
.end method

.method public isCancelled()Z
    .locals 2

    .prologue
    .line 165
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 167
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-interface {v0}, Lorg/eclipse/jgit/lib/ProgressMonitor;->isCancelled()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 169
    iget-object v1, p0, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return v0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0
.end method

.method public pollForUpdates()V
    .locals 1

    .prologue
    .line 130
    sget-boolean v0, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->isMainThread()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 131
    :cond_0
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->doUpdates()V

    .line 132
    return-void
.end method

.method public start(I)V
    .locals 1
    .parameter "totalTasks"

    .prologue
    .line 91
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->isMainThread()Z

    move-result v0

    if-nez v0, :cond_0

    .line 92
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 93
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-interface {v0, p1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->start(I)V

    .line 94
    return-void
.end method

.method public startWorker()V
    .locals 1

    .prologue
    .line 104
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->startWorkers(I)V

    .line 105
    return-void
.end method

.method public startWorkers(I)V
    .locals 1
    .parameter "count"

    .prologue
    .line 114
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->workers:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    .line 115
    return-void
.end method

.method public update(I)V
    .locals 1
    .parameter "completed"

    .prologue
    .line 160
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->pendingUpdates:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndAdd(I)I

    move-result v0

    if-nez v0, :cond_0

    .line 161
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->process:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 162
    :cond_0
    return-void
.end method

.method public waitForCompletion()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 145
    sget-boolean v0, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->isMainThread()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 146
    :cond_0
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->workers:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-lez v0, :cond_1

    .line 147
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->doUpdates()V

    .line 148
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->process:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->acquire()V

    goto :goto_0

    .line 150
    :cond_1
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->doUpdates()V

    .line 151
    return-void
.end method
