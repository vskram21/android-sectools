.class final Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmThread;
.super Ljava/lang/Thread;
.source "InterruptTimer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/util/io/InterruptTimer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "AlarmThread"
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;)V
    .locals 1
    .parameter "name"
    .parameter "q"

    .prologue
    .line 143
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 144
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmThread;->setName(Ljava/lang/String;)V

    .line 145
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmThread;->setDaemon(Z)V

    .line 146
    return-void
.end method
