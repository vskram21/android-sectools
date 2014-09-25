.class final Lorg/eclipse/jgit/util/FS$2;
.super Ljava/lang/Thread;
.source "FS.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/util/FS;->readPipe(Ljava/io/File;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$debug:Z

.field final synthetic val$gooblerFail:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final synthetic val$p:Ljava/lang/Process;


# direct methods
.method constructor <init>(Ljava/lang/Process;ZLjava/util/concurrent/atomic/AtomicBoolean;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 419
    iput-object p1, p0, Lorg/eclipse/jgit/util/FS$2;->val$p:Ljava/lang/Process;

    iput-boolean p2, p0, Lorg/eclipse/jgit/util/FS$2;->val$debug:Z

    iput-object p3, p0, Lorg/eclipse/jgit/util/FS$2;->val$gooblerFail:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    const/4 v5, -0x1

    .line 421
    iget-object v3, p0, Lorg/eclipse/jgit/util/FS$2;->val$p:Ljava/lang/Process;

    invoke-virtual {v3}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v2

    .line 424
    .local v2, is:Ljava/io/InputStream;
    :try_start_0
    iget-boolean v3, p0, Lorg/eclipse/jgit/util/FS$2;->val$debug:Z

    if-eqz v3, :cond_2

    .line 425
    :goto_0
    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    move-result v0

    .local v0, ch:I
    if-eq v0, v5, :cond_1

    .line 426
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    int-to-char v4, v0

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->print(C)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 431
    .end local v0           #ch:I
    :catch_0
    move-exception v1

    .line 433
    .local v1, e:Ljava/io/IOException;
    iget-boolean v3, p0, Lorg/eclipse/jgit/util/FS$2;->val$debug:Z

    if-eqz v3, :cond_0

    .line 434
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v1, v3}, Ljava/io/IOException;->printStackTrace(Ljava/io/PrintStream;)V

    .line 435
    :cond_0
    iget-object v3, p0, Lorg/eclipse/jgit/util/FS$2;->val$gooblerFail:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v3, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 438
    .end local v1           #e:Ljava/io/IOException;
    :cond_1
    :try_start_1
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 445
    :goto_1
    return-void

    .line 428
    :cond_2
    :goto_2
    :try_start_2
    invoke-virtual {v2}, Ljava/io/InputStream;->read()I
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    move-result v3

    if-eq v3, v5, :cond_1

    goto :goto_2

    .line 439
    :catch_1
    move-exception v1

    .line 441
    .restart local v1       #e:Ljava/io/IOException;
    iget-boolean v3, p0, Lorg/eclipse/jgit/util/FS$2;->val$debug:Z

    if-eqz v3, :cond_3

    .line 442
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v1, v3}, Ljava/io/IOException;->printStackTrace(Ljava/io/PrintStream;)V

    .line 443
    :cond_3
    iget-object v3, p0, Lorg/eclipse/jgit/util/FS$2;->val$gooblerFail:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v3, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    goto :goto_1
.end method
