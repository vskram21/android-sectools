.class public abstract Lorg/eclipse/jgit/lib/BatchingProgressMonitor;
.super Ljava/lang/Object;
.source "BatchingProgressMonitor.java"

# interfaces
.implements Lorg/eclipse/jgit/lib/ProgressMonitor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;
    }
.end annotation


# static fields
.field private static final alarmQueue:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

.field static final alarmQueueKiller:Ljava/lang/Object;


# instance fields
.field private delayStartTime:J

.field private delayStartUnit:Ljava/util/concurrent/TimeUnit;

.field private task:Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 64
    const/4 v0, 0x1

    .line 65
    .local v0, threads:I
    new-instance v1, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    new-instance v2, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$1;

    invoke-direct {v2}, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$1;-><init>()V

    invoke-direct {v1, v0, v2}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(ILjava/util/concurrent/ThreadFactory;)V

    sput-object v1, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;->alarmQueue:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 77
    sget-object v1, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;->alarmQueue:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    invoke-virtual {v1, v3}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->setContinueExistingPeriodicTasksAfterShutdownPolicy(Z)V

    .line 78
    sget-object v1, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;->alarmQueue:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    invoke-virtual {v1, v3}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->setExecuteExistingDelayedTasksAfterShutdownPolicy(Z)V

    .line 79
    sget-object v1, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;->alarmQueue:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    invoke-virtual {v1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->prestartAllCoreThreads()I

    .line 85
    sget-object v1, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;->alarmQueue:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    invoke-static {}, Ljava/util/concurrent/Executors;->defaultThreadFactory()Ljava/util/concurrent/ThreadFactory;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->setThreadFactory(Ljava/util/concurrent/ThreadFactory;)V

    .line 87
    new-instance v1, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$2;

    invoke-direct {v1}, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$2;-><init>()V

    sput-object v1, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;->alarmQueueKiller:Ljava/lang/Object;

    .line 93
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 97
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    iput-object v0, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;->delayStartUnit:Ljava/util/concurrent/TimeUnit;

    .line 192
    return-void
.end method

.method static synthetic access$000()Ljava/util/concurrent/ScheduledThreadPoolExecutor;
    .locals 1

    .prologue
    .line 53
    sget-object v0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;->alarmQueue:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    return-object v0
.end method


# virtual methods
.method public beginTask(Ljava/lang/String;I)V
    .locals 4
    .parameter "title"
    .parameter "work"

    .prologue
    .line 120
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;->endTask()V

    .line 121
    new-instance v0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;

    invoke-direct {v0, p1, p2}, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;-><init>(Ljava/lang/String;I)V

    iput-object v0, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;->task:Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;

    .line 122
    iget-wide v0, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;->delayStartTime:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 123
    iget-object v0, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;->task:Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;

    iget-wide v1, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;->delayStartTime:J

    iget-object v3, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;->delayStartUnit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3}, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->delay(JLjava/util/concurrent/TimeUnit;)V

    .line 124
    :cond_0
    return-void
.end method

.method public endTask()V
    .locals 1

    .prologue
    .line 132
    iget-object v0, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;->task:Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;

    if-eqz v0, :cond_0

    .line 133
    iget-object v0, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;->task:Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;

    invoke-virtual {v0, p0}, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->end(Lorg/eclipse/jgit/lib/BatchingProgressMonitor;)V

    .line 134
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;->task:Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;

    .line 136
    :cond_0
    return-void
.end method

.method public isCancelled()Z
    .locals 1

    .prologue
    .line 139
    const/4 v0, 0x0

    return v0
.end method

.method protected abstract onEndTask(Ljava/lang/String;I)V
.end method

.method protected abstract onEndTask(Ljava/lang/String;III)V
.end method

.method protected abstract onUpdate(Ljava/lang/String;I)V
.end method

.method protected abstract onUpdate(Ljava/lang/String;III)V
.end method

.method public setDelayStart(JLjava/util/concurrent/TimeUnit;)V
    .locals 0
    .parameter "time"
    .parameter "unit"

    .prologue
    .line 111
    iput-wide p1, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;->delayStartTime:J

    .line 112
    iput-object p3, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;->delayStartUnit:Ljava/util/concurrent/TimeUnit;

    .line 113
    return-void
.end method

.method public start(I)V
    .locals 0
    .parameter "totalTasks"

    .prologue
    .line 117
    return-void
.end method

.method public update(I)V
    .locals 1
    .parameter "completed"

    .prologue
    .line 127
    iget-object v0, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;->task:Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;

    if-eqz v0, :cond_0

    .line 128
    iget-object v0, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;->task:Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;

    invoke-virtual {v0, p0, p1}, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->update(Lorg/eclipse/jgit/lib/BatchingProgressMonitor;I)V

    .line 129
    :cond_0
    return-void
.end method
