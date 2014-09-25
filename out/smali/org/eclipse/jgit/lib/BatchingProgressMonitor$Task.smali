.class Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;
.super Ljava/lang/Object;
.source "BatchingProgressMonitor.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/lib/BatchingProgressMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Task"
.end annotation


# instance fields
.field private volatile display:Z

.field private lastPercent:I

.field private lastWork:I

.field private output:Z

.field private final taskName:Ljava/lang/String;

.field private timerFuture:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<*>;"
        }
    .end annotation
.end field

.field private final totalWork:I


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .parameter "taskName"
    .parameter "totalWork"

    .prologue
    .line 214
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 215
    iput-object p1, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->taskName:Ljava/lang/String;

    .line 216
    iput p2, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->totalWork:I

    .line 217
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->display:Z

    .line 218
    return-void
.end method

.method private restartTimer()V
    .locals 4

    .prologue
    .line 256
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->display:Z

    .line 257
    invoke-static {}, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;->access$000()Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    move-result-object v0

    const-wide/16 v1, 0x1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p0, v1, v2, v3}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->timerFuture:Ljava/util/concurrent/Future;

    .line 258
    return-void
.end method


# virtual methods
.method delay(JLjava/util/concurrent/TimeUnit;)V
    .locals 1
    .parameter "time"
    .parameter "unit"

    .prologue
    .line 221
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->display:Z

    .line 222
    invoke-static {}, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;->access$000()Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2, p3}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->timerFuture:Ljava/util/concurrent/Future;

    .line 223
    return-void
.end method

.method end(Lorg/eclipse/jgit/lib/BatchingProgressMonitor;)V
    .locals 4
    .parameter "pm"

    .prologue
    .line 261
    iget-boolean v1, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->output:Z

    if-eqz v1, :cond_0

    .line 262
    iget v1, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->totalWork:I

    if-nez v1, :cond_2

    .line 263
    iget-object v1, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->taskName:Ljava/lang/String;

    iget v2, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->lastWork:I

    invoke-virtual {p1, v1, v2}, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;->onEndTask(Ljava/lang/String;I)V

    .line 269
    :cond_0
    :goto_0
    iget-object v1, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->timerFuture:Ljava/util/concurrent/Future;

    if-eqz v1, :cond_1

    .line 270
    iget-object v1, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->timerFuture:Ljava/util/concurrent/Future;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 271
    :cond_1
    return-void

    .line 265
    :cond_2
    iget v1, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->lastWork:I

    mul-int/lit8 v1, v1, 0x64

    iget v2, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->totalWork:I

    div-int v0, v1, v2

    .line 266
    .local v0, pDone:I
    iget-object v1, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->taskName:Ljava/lang/String;

    iget v2, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->lastWork:I

    iget v3, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->totalWork:I

    invoke-virtual {p1, v1, v2, v3, v0}, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;->onEndTask(Ljava/lang/String;III)V

    goto :goto_0
.end method

.method public run()V
    .locals 1

    .prologue
    .line 226
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->display:Z

    .line 227
    return-void
.end method

.method update(Lorg/eclipse/jgit/lib/BatchingProgressMonitor;I)V
    .locals 5
    .parameter "pm"
    .parameter "completed"

    .prologue
    const/4 v4, 0x1

    .line 230
    iget v1, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->lastWork:I

    add-int/2addr v1, p2

    iput v1, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->lastWork:I

    .line 232
    iget v1, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->totalWork:I

    if-nez v1, :cond_1

    .line 234
    iget-boolean v1, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->display:Z

    if-eqz v1, :cond_0

    .line 235
    iget-object v1, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->taskName:Ljava/lang/String;

    iget v2, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->lastWork:I

    invoke-virtual {p1, v1, v2}, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;->onUpdate(Ljava/lang/String;I)V

    .line 236
    iput-boolean v4, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->output:Z

    .line 237
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->restartTimer()V

    .line 253
    :cond_0
    :goto_0
    return-void

    .line 241
    :cond_1
    iget v1, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->lastWork:I

    mul-int/lit8 v1, v1, 0x64

    iget v2, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->totalWork:I

    div-int v0, v1, v2

    .line 242
    .local v0, currPercent:I
    iget-boolean v1, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->display:Z

    if-eqz v1, :cond_2

    .line 243
    iget-object v1, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->taskName:Ljava/lang/String;

    iget v2, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->lastWork:I

    iget v3, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->totalWork:I

    invoke-virtual {p1, v1, v2, v3, v0}, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;->onUpdate(Ljava/lang/String;III)V

    .line 244
    iput-boolean v4, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->output:Z

    .line 245
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->restartTimer()V

    .line 246
    iput v0, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->lastPercent:I

    goto :goto_0

    .line 247
    :cond_2
    iget v1, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->lastPercent:I

    if-eq v0, v1, :cond_0

    .line 248
    iget-object v1, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->taskName:Ljava/lang/String;

    iget v2, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->lastWork:I

    iget v3, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->totalWork:I

    invoke-virtual {p1, v1, v2, v3, v0}, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;->onUpdate(Ljava/lang/String;III)V

    .line 249
    iput-boolean v4, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->output:Z

    .line 250
    iput v0, p0, Lorg/eclipse/jgit/lib/BatchingProgressMonitor$Task;->lastPercent:I

    goto :goto_0
.end method
