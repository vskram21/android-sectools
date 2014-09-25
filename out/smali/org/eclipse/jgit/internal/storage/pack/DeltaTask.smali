.class final Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;
.super Ljava/lang/Object;
.source "DeltaTask.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;,
        Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;,
        Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$WeightedPath;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# static fields
.field static final MAX_METER:J = 0x900000L


# instance fields
.field private final block:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;

.field private dw:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;

.field private or:Lorg/eclipse/jgit/lib/ObjectReader;

.field private final slices:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;)V
    .locals 1
    .parameter "b"

    .prologue
    .line 258
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 259
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->block:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;

    .line 260
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->slices:Ljava/util/LinkedList;

    .line 261
    return-void
.end method

.method static synthetic access$000(Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;)Ljava/util/LinkedList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 59
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->slices:Ljava/util/LinkedList;

    return-object v0
.end method

.method private runWindow(Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;)V
    .locals 2
    .parameter "w"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 309
    :try_start_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->search()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 311
    monitor-enter p0

    .line 312
    const/4 v0, 0x0

    :try_start_1
    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->dw:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;

    .line 313
    monitor-exit p0

    .line 315
    return-void

    .line 313
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 311
    :catchall_1
    move-exception v0

    monitor-enter p0

    .line 312
    const/4 v1, 0x0

    :try_start_2
    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->dw:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;

    .line 313
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    throw v0

    :catchall_2
    move-exception v0

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    throw v0
.end method


# virtual methods
.method add(Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;)V
    .locals 5
    .parameter "s"

    .prologue
    .line 264
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->slices:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 265
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->slices:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;

    .line 266
    .local v0, last:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;
    iget v1, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;->endIndex:I

    iget v2, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;->beginIndex:I

    if-ne v1, v2, :cond_0

    .line 267
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->slices:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    .line 268
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->slices:Ljava/util/LinkedList;

    new-instance v2, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;

    iget v3, v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;->beginIndex:I

    iget v4, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;->endIndex:I

    invoke-direct {v2, v3, v4}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;-><init>(II)V

    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 273
    .end local v0           #last:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;
    :goto_0
    return-void

    .line 272
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->slices:Ljava/util/LinkedList;

    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public call()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 276
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->block:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;

    iget-object v1, v1, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->templateReader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectReader;->newReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->or:Lorg/eclipse/jgit/lib/ObjectReader;

    .line 280
    :goto_0
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 281
    :try_start_1
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->slices:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 282
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 287
    :goto_1
    :try_start_2
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->block:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;

    invoke-virtual {v1, p0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->stealWork(Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;)Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;

    move-result-object v0

    .local v0, w:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;
    if-eqz v0, :cond_1

    .line 288
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->runWindow(Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 290
    .end local v0           #w:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->block:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;

    iget-object v2, v2, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->pm:Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->endWorker()V

    .line 291
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->or:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    .line 292
    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->or:Lorg/eclipse/jgit/lib/ObjectReader;

    throw v1

    .line 283
    :cond_0
    :try_start_3
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->slices:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;

    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->initWindow(Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;)Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;

    move-result-object v0

    .line 284
    .restart local v0       #w:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 285
    :try_start_4
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->runWindow(Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 284
    .end local v0           #w:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;
    :catchall_1
    move-exception v1

    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :try_start_6
    throw v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 290
    .restart local v0       #w:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->block:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;

    iget-object v1, v1, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->pm:Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;->endWorker()V

    .line 291
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->or:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    .line 292
    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->or:Lorg/eclipse/jgit/lib/ObjectReader;

    .line 294
    return-object v3
.end method

.method initWindow(Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;)Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;
    .locals 10
    .parameter "s"

    .prologue
    .line 298
    new-instance v0, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->block:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;

    iget-object v1, v1, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->block:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;

    iget-object v2, v2, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->dc:Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->or:Lorg/eclipse/jgit/lib/ObjectReader;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->block:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;

    iget-object v4, v4, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->pm:Lorg/eclipse/jgit/lib/ThreadSafeProgressMonitor;

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->block:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;

    #getter for: Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->bytesPerUnit:J
    invoke-static {v5}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->access$100(Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;)J

    move-result-wide v5

    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->block:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;

    iget-object v7, v7, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Block;->list:[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    iget v8, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;->beginIndex:I

    iget v9, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;->endIndex:I

    invoke-direct/range {v0 .. v9}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;-><init>(Lorg/eclipse/jgit/storage/pack/PackConfig;Lorg/eclipse/jgit/internal/storage/pack/DeltaCache;Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/ProgressMonitor;J[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;II)V

    .line 301
    .local v0, w:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;
    monitor-enter p0

    .line 302
    :try_start_0
    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->dw:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;

    .line 303
    monitor-exit p0

    .line 304
    return-object v0

    .line 303
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method declared-synchronized remaining()Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;
    .locals 2

    .prologue
    .line 318
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->slices:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 319
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->slices:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 321
    :goto_0
    monitor-exit p0

    return-object v1

    .line 320
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->dw:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;

    .line 321
    .local v0, d:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->remaining()Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 318
    .end local v0           #d:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method declared-synchronized tryStealWork(Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;)Z
    .locals 3
    .parameter "s"

    .prologue
    .line 325
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->slices:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->slices:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;

    iget v1, v1, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;->beginIndex:I

    iget v2, p1, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;->beginIndex:I

    if-ne v1, v2, :cond_0

    .line 326
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->slices:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 327
    const/4 v1, 0x1

    .line 330
    :goto_0
    monitor-exit p0

    return v1

    .line 329
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->dw:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;

    .line 330
    .local v0, d:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;
    if-eqz v0, :cond_1

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;->tryStealWork(Lorg/eclipse/jgit/internal/storage/pack/DeltaTask$Slice;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 325
    .end local v0           #d:Lorg/eclipse/jgit/internal/storage/pack/DeltaWindow;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method
