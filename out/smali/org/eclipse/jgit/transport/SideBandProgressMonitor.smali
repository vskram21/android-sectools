.class Lorg/eclipse/jgit/transport/SideBandProgressMonitor;
.super Lorg/eclipse/jgit/lib/BatchingProgressMonitor;
.source "SideBandProgressMonitor.java"


# instance fields
.field private final out:Ljava/io/OutputStream;

.field private write:Z


# direct methods
.method constructor <init>(Ljava/io/OutputStream;)V
    .locals 1
    .parameter "os"

    .prologue
    .line 58
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;-><init>()V

    .line 59
    iput-object p1, p0, Lorg/eclipse/jgit/transport/SideBandProgressMonitor;->out:Ljava/io/OutputStream;

    .line 60
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/SideBandProgressMonitor;->write:Z

    .line 61
    return-void
.end method

.method private format(Ljava/lang/StringBuilder;Ljava/lang/String;I)V
    .locals 1
    .parameter "s"
    .parameter "taskName"
    .parameter "workCurr"

    .prologue
    .line 80
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    const-string v0, ": "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 83
    return-void
.end method

.method private format(Ljava/lang/StringBuilder;Ljava/lang/String;III)V
    .locals 2
    .parameter "s"
    .parameter "taskName"
    .parameter "cmp"
    .parameter "totalWork"
    .parameter "pcnt"

    .prologue
    const/16 v1, 0x20

    .line 103
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    const-string v0, ": "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    const/16 v0, 0x64

    if-ge p5, v0, :cond_0

    .line 106
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 107
    :cond_0
    const/16 v0, 0xa

    if-ge p5, v0, :cond_1

    .line 108
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 109
    :cond_1
    invoke-virtual {p1, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 110
    const-string v0, "% ("

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 112
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 114
    const-string v0, ")"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    return-void
.end method

.method private send(Ljava/lang/StringBuilder;)V
    .locals 3
    .parameter "s"

    .prologue
    .line 118
    iget-boolean v1, p0, Lorg/eclipse/jgit/transport/SideBandProgressMonitor;->write:Z

    if-eqz v1, :cond_0

    .line 120
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jgit/transport/SideBandProgressMonitor;->out:Ljava/io/OutputStream;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 121
    iget-object v1, p0, Lorg/eclipse/jgit/transport/SideBandProgressMonitor;->out:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 126
    :cond_0
    :goto_0
    return-void

    .line 122
    :catch_0
    move-exception v0

    .line 123
    .local v0, err:Ljava/io/IOException;
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/eclipse/jgit/transport/SideBandProgressMonitor;->write:Z

    goto :goto_0
.end method


# virtual methods
.method protected onEndTask(Ljava/lang/String;I)V
    .locals 2
    .parameter "taskName"
    .parameter "workCurr"

    .prologue
    .line 73
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    .local v0, s:Ljava/lang/StringBuilder;
    invoke-direct {p0, v0, p1, p2}, Lorg/eclipse/jgit/transport/SideBandProgressMonitor;->format(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 75
    const-string v1, ", done\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/transport/SideBandProgressMonitor;->send(Ljava/lang/StringBuilder;)V

    .line 77
    return-void
.end method

.method protected onEndTask(Ljava/lang/String;III)V
    .locals 6
    .parameter "taskName"
    .parameter "cmp"
    .parameter "totalWork"
    .parameter "pcnt"

    .prologue
    .line 95
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .local v1, s:Ljava/lang/StringBuilder;
    move-object v0, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    .line 96
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/transport/SideBandProgressMonitor;->format(Ljava/lang/StringBuilder;Ljava/lang/String;III)V

    .line 97
    const-string v0, "\n"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    invoke-direct {p0, v1}, Lorg/eclipse/jgit/transport/SideBandProgressMonitor;->send(Ljava/lang/StringBuilder;)V

    .line 99
    return-void
.end method

.method protected onUpdate(Ljava/lang/String;I)V
    .locals 2
    .parameter "taskName"
    .parameter "workCurr"

    .prologue
    .line 65
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 66
    .local v0, s:Ljava/lang/StringBuilder;
    invoke-direct {p0, v0, p1, p2}, Lorg/eclipse/jgit/transport/SideBandProgressMonitor;->format(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 67
    const-string v1, "   \r"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/transport/SideBandProgressMonitor;->send(Ljava/lang/StringBuilder;)V

    .line 69
    return-void
.end method

.method protected onUpdate(Ljava/lang/String;III)V
    .locals 6
    .parameter "taskName"
    .parameter "cmp"
    .parameter "totalWork"
    .parameter "pcnt"

    .prologue
    .line 87
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .local v1, s:Ljava/lang/StringBuilder;
    move-object v0, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    .line 88
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/transport/SideBandProgressMonitor;->format(Ljava/lang/StringBuilder;Ljava/lang/String;III)V

    .line 89
    const-string v0, "   \r"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    invoke-direct {p0, v1}, Lorg/eclipse/jgit/transport/SideBandProgressMonitor;->send(Ljava/lang/StringBuilder;)V

    .line 91
    return-void
.end method
