.class final Lorg/eclipse/jgit/util/io/InterruptTimer$AutoKiller;
.super Ljava/lang/Object;
.source "InterruptTimer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/util/io/InterruptTimer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "AutoKiller"
.end annotation


# instance fields
.field private final state:Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;)V
    .locals 0
    .parameter "s"

    .prologue
    .line 158
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 159
    iput-object p1, p0, Lorg/eclipse/jgit/util/io/InterruptTimer$AutoKiller;->state:Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;

    .line 160
    return-void
.end method


# virtual methods
.method protected finalize()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 164
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/InterruptTimer$AutoKiller;->state:Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/io/InterruptTimer$AlarmState;->terminate()V

    .line 165
    return-void
.end method
