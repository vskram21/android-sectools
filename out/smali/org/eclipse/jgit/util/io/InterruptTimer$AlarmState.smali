.class final Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;
.super Ljava/lang/Object;
.source "InterruptTimer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/util/io/InterruptTimer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "AlarmState"
.end annotation


# instance fields
.field private callingThread:Ljava/lang/Thread;

.field private deadline:J

.field private terminated:Z


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 175
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 176
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;->callingThread:Ljava/lang/Thread;

    .line 177
    return-void
.end method

.method private static now()J
    .locals 2

    .prologue
    .line 224
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    return-wide v0
.end method


# virtual methods
.method declared-synchronized begin(I)V
    .locals 4
    .parameter "timeout"

    .prologue
    .line 200
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;->terminated:Z

    if-eqz v0, :cond_0

    .line 201
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->timerAlreadyTerminated:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 200
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 202
    :cond_0
    :try_start_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;->callingThread:Ljava/lang/Thread;

    .line 203
    invoke-static {}, Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;->now()J

    move-result-wide v0

    int-to-long v2, p1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;->deadline:J

    .line 204
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 205
    monitor-exit p0

    return-void
.end method

.method declared-synchronized end()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 208
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;->deadline:J

    cmp-long v0, v2, v0

    if-nez v0, :cond_0

    .line 209
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 212
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 213
    monitor-exit p0

    return-void

    .line 211
    :cond_0
    const-wide/16 v0, 0x0

    :try_start_1
    iput-wide v0, p0, Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;->deadline:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 208
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized run()V
    .locals 8

    .prologue
    const-wide/16 v6, 0x0

    .line 180
    monitor-enter p0

    :goto_0
    :try_start_0
    iget-boolean v2, p0, Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;->terminated:Z

    if-nez v2, :cond_2

    iget-object v2, p0, Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;->callingThread:Ljava/lang/Thread;

    invoke-virtual {v2}, Ljava/lang/Thread;->isAlive()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-eqz v2, :cond_2

    .line 182
    :try_start_1
    iget-wide v2, p0, Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;->deadline:J

    cmp-long v2, v6, v2

    if-gez v2, :cond_1

    .line 183
    iget-wide v2, p0, Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;->deadline:J

    invoke-static {}, Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;->now()J

    move-result-wide v4

    sub-long v0, v2, v4

    .line 184
    .local v0, delay:J
    cmp-long v2, v0, v6

    if-gtz v2, :cond_0

    .line 185
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;->deadline:J

    .line 186
    iget-object v2, p0, Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;->callingThread:Ljava/lang/Thread;

    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 193
    .end local v0           #delay:J
    :catch_0
    move-exception v2

    goto :goto_0

    .line 188
    .restart local v0       #delay:J
    :cond_0
    invoke-virtual {p0, v0, v1}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 180
    .end local v0           #delay:J
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 191
    :cond_1
    const-wide/16 v2, 0x3e8

    :try_start_2
    invoke-virtual {p0, v2, v3}, Ljava/lang/Object;->wait(J)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 197
    :cond_2
    monitor-exit p0

    return-void
.end method

.method declared-synchronized terminate()V
    .locals 2

    .prologue
    .line 216
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;->terminated:Z

    if-nez v0, :cond_0

    .line 217
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;->deadline:J

    .line 218
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;->terminated:Z

    .line 219
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 221
    :cond_0
    monitor-exit p0

    return-void

    .line 216
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
