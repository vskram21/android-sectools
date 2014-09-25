.class public final Lorg/eclipse/jgit/util/io/InterruptTimer;
.super Ljava/lang/Object;
.source "InterruptTimer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;,
        Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmThread;,
        Lorg/eclipse/jgit/util/io/InterruptTimer$AutoKiller;
    }
.end annotation


# instance fields
.field final autoKiller:Lorg/eclipse/jgit/util/io/InterruptTimer$AutoKiller;

.field private final state:Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;

.field private final thread:Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmThread;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 93
    const-string v0, "JGit-InterruptTimer"

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/util/io/InterruptTimer;-><init>(Ljava/lang/String;)V

    .line 94
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .parameter "threadName"

    .prologue
    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 105
    new-instance v0, Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;

    invoke-direct {v0}, Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/util/io/InterruptTimer;->state:Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;

    .line 106
    new-instance v0, Lorg/eclipse/jgit/util/io/InterruptTimer$AutoKiller;

    iget-object v1, p0, Lorg/eclipse/jgit/util/io/InterruptTimer;->state:Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/util/io/InterruptTimer$AutoKiller;-><init>(Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;)V

    iput-object v0, p0, Lorg/eclipse/jgit/util/io/InterruptTimer;->autoKiller:Lorg/eclipse/jgit/util/io/InterruptTimer$AutoKiller;

    .line 107
    new-instance v0, Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmThread;

    iget-object v1, p0, Lorg/eclipse/jgit/util/io/InterruptTimer;->state:Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;

    invoke-direct {v0, p1, v1}, Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmThread;-><init>(Ljava/lang/String;Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;)V

    iput-object v0, p0, Lorg/eclipse/jgit/util/io/InterruptTimer;->thread:Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmThread;

    .line 108
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/InterruptTimer;->thread:Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmThread;

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmThread;->start()V

    .line 109
    return-void
.end method


# virtual methods
.method public begin(I)V
    .locals 5
    .parameter "timeout"

    .prologue
    .line 119
    if-gtz p1, :cond_0

    .line 120
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->invalidTimeout:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 122
    :cond_0
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 123
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/InterruptTimer;->state:Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;->begin(I)V

    .line 124
    return-void
.end method

.method public end()V
    .locals 1

    .prologue
    .line 128
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/InterruptTimer;->state:Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;->end()V

    .line 129
    return-void
.end method

.method public terminate()V
    .locals 1

    .prologue
    .line 133
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/InterruptTimer;->state:Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;->terminate()V

    .line 135
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/InterruptTimer;->thread:Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmThread;

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmThread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 139
    :goto_0
    return-void

    .line 136
    :catch_0
    move-exception v0

    goto :goto_0
.end method
