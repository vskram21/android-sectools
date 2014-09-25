.class public Lorg/eclipse/jgit/lib/TextProgressMonitor;
.super Lorg/eclipse/jgit/lib/BatchingProgressMonitor;
.source "TextProgressMonitor.java"


# instance fields
.field private final out:Ljava/io/Writer;

.field private write:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 59
    new-instance v0, Ljava/io/PrintWriter;

    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-direct {v0, v1}, Ljava/io/PrintWriter;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/lib/TextProgressMonitor;-><init>(Ljava/io/Writer;)V

    .line 60
    return-void
.end method

.method public constructor <init>(Ljava/io/Writer;)V
    .locals 1
    .parameter "out"

    .prologue
    .line 68
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/BatchingProgressMonitor;-><init>()V

    .line 69
    iput-object p1, p0, Lorg/eclipse/jgit/lib/TextProgressMonitor;->out:Ljava/io/Writer;

    .line 70
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/lib/TextProgressMonitor;->write:Z

    .line 71
    return-void
.end method

.method private format(Ljava/lang/StringBuilder;Ljava/lang/String;I)V
    .locals 2
    .parameter "s"
    .parameter "taskName"
    .parameter "workCurr"

    .prologue
    .line 89
    const-string v0, "\r"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    const-string v0, ": "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    :goto_0
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    const/16 v1, 0x19

    if-ge v0, v1, :cond_0

    .line 93
    const/16 v0, 0x20

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 94
    :cond_0
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 95
    return-void
.end method

.method private format(Ljava/lang/StringBuilder;Ljava/lang/String;III)V
    .locals 5
    .parameter "s"
    .parameter "taskName"
    .parameter "cmp"
    .parameter "totalWork"
    .parameter "pcnt"

    .prologue
    const/16 v4, 0x20

    .line 114
    const-string v2, "\r"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    const-string v2, ": "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    :goto_0
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    const/16 v3, 0x19

    if-ge v2, v3, :cond_0

    .line 118
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 120
    :cond_0
    invoke-static {p4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    .line 121
    .local v1, endStr:Ljava/lang/String;
    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    .line 122
    .local v0, curStr:Ljava/lang/String;
    :goto_1
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 123
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 124
    :cond_1
    const/16 v2, 0x64

    if-ge p5, v2, :cond_2

    .line 125
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 126
    :cond_2
    const/16 v2, 0xa

    if-ge p5, v2, :cond_3

    .line 127
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 128
    :cond_3
    invoke-virtual {p1, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 129
    const-string v2, "% ("

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    const-string v2, "/"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    const-string v2, ")"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    return-void
.end method

.method private send(Ljava/lang/StringBuilder;)V
    .locals 3
    .parameter "s"

    .prologue
    .line 137
    iget-boolean v1, p0, Lorg/eclipse/jgit/lib/TextProgressMonitor;->write:Z

    if-eqz v1, :cond_0

    .line 139
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jgit/lib/TextProgressMonitor;->out:Ljava/io/Writer;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 140
    iget-object v1, p0, Lorg/eclipse/jgit/lib/TextProgressMonitor;->out:Ljava/io/Writer;

    invoke-virtual {v1}, Ljava/io/Writer;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 145
    :cond_0
    :goto_0
    return-void

    .line 141
    :catch_0
    move-exception v0

    .line 142
    .local v0, err:Ljava/io/IOException;
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/eclipse/jgit/lib/TextProgressMonitor;->write:Z

    goto :goto_0
.end method


# virtual methods
.method protected onEndTask(Ljava/lang/String;I)V
    .locals 2
    .parameter "taskName"
    .parameter "workCurr"

    .prologue
    .line 82
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 83
    .local v0, s:Ljava/lang/StringBuilder;
    invoke-direct {p0, v0, p1, p2}, Lorg/eclipse/jgit/lib/TextProgressMonitor;->format(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 84
    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/lib/TextProgressMonitor;->send(Ljava/lang/StringBuilder;)V

    .line 86
    return-void
.end method

.method protected onEndTask(Ljava/lang/String;III)V
    .locals 6
    .parameter "taskName"
    .parameter "cmp"
    .parameter "totalWork"
    .parameter "pcnt"

    .prologue
    .line 106
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .local v1, s:Ljava/lang/StringBuilder;
    move-object v0, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    .line 107
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/lib/TextProgressMonitor;->format(Ljava/lang/StringBuilder;Ljava/lang/String;III)V

    .line 108
    const-string v0, "\n"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    invoke-direct {p0, v1}, Lorg/eclipse/jgit/lib/TextProgressMonitor;->send(Ljava/lang/StringBuilder;)V

    .line 110
    return-void
.end method

.method protected onUpdate(Ljava/lang/String;I)V
    .locals 1
    .parameter "taskName"
    .parameter "workCurr"

    .prologue
    .line 75
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .local v0, s:Ljava/lang/StringBuilder;
    invoke-direct {p0, v0, p1, p2}, Lorg/eclipse/jgit/lib/TextProgressMonitor;->format(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 77
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/lib/TextProgressMonitor;->send(Ljava/lang/StringBuilder;)V

    .line 78
    return-void
.end method

.method protected onUpdate(Ljava/lang/String;III)V
    .locals 6
    .parameter "taskName"
    .parameter "cmp"
    .parameter "totalWork"
    .parameter "pcnt"

    .prologue
    .line 99
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .local v1, s:Ljava/lang/StringBuilder;
    move-object v0, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    .line 100
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/lib/TextProgressMonitor;->format(Ljava/lang/StringBuilder;Ljava/lang/String;III)V

    .line 101
    invoke-direct {p0, v1}, Lorg/eclipse/jgit/lib/TextProgressMonitor;->send(Ljava/lang/StringBuilder;)V

    .line 102
    return-void
.end method
