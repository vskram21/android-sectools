.class public abstract Lorg/eclipse/jgit/util/FS;
.super Ljava/lang/Object;
.source "FS.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/util/FS$Attributes;,
        Lorg/eclipse/jgit/util/FS$FSFactory;,
        Lorg/eclipse/jgit/util/FS$Holder;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final DETECTED:Lorg/eclipse/jgit/util/FS;

.field private static factory:Lorg/eclipse/jgit/util/FS$FSFactory;


# instance fields
.field private volatile gitPrefix:Lorg/eclipse/jgit/util/FS$Holder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/util/FS$Holder",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field private volatile userHome:Lorg/eclipse/jgit/util/FS$Holder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/util/FS$Holder",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 61
    const-class v0, Lorg/eclipse/jgit/util/FS;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/eclipse/jgit/util/FS;->$assertionsDisabled:Z

    .line 98
    invoke-static {}, Lorg/eclipse/jgit/util/FS;->detect()Lorg/eclipse/jgit/util/FS;

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/util/FS;->DETECTED:Lorg/eclipse/jgit/util/FS;

    return-void

    .line 61
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 161
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 163
    return-void
.end method

.method protected constructor <init>(Lorg/eclipse/jgit/util/FS;)V
    .locals 1
    .parameter "src"

    .prologue
    .line 171
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 172
    iget-object v0, p1, Lorg/eclipse/jgit/util/FS;->userHome:Lorg/eclipse/jgit/util/FS$Holder;

    iput-object v0, p0, Lorg/eclipse/jgit/util/FS;->userHome:Lorg/eclipse/jgit/util/FS$Holder;

    .line 173
    iget-object v0, p1, Lorg/eclipse/jgit/util/FS;->gitPrefix:Lorg/eclipse/jgit/util/FS$Holder;

    iput-object v0, p0, Lorg/eclipse/jgit/util/FS;->gitPrefix:Lorg/eclipse/jgit/util/FS$Holder;

    .line 174
    return-void
.end method

.method public static detect()Lorg/eclipse/jgit/util/FS;
    .locals 1

    .prologue
    .line 108
    const/4 v0, 0x0

    invoke-static {v0}, Lorg/eclipse/jgit/util/FS;->detect(Ljava/lang/Boolean;)Lorg/eclipse/jgit/util/FS;

    move-result-object v0

    return-object v0
.end method

.method public static detect(Ljava/lang/Boolean;)Lorg/eclipse/jgit/util/FS;
    .locals 3
    .parameter "cygwinUsed"

    .prologue
    .line 133
    sget-object v2, Lorg/eclipse/jgit/util/FS;->factory:Lorg/eclipse/jgit/util/FS$FSFactory;

    if-nez v2, :cond_0

    .line 135
    :try_start_0
    const-string v2, "org.eclipse.jgit.util.Java7FSFactory"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 138
    .local v0, activatorClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/util/FS$FSFactory;

    sput-object v2, Lorg/eclipse/jgit/util/FS;->factory:Lorg/eclipse/jgit/util/FS$FSFactory;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/UnsupportedClassVersionError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_3

    .line 151
    .end local v0           #activatorClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    :cond_0
    :goto_0
    sget-object v2, Lorg/eclipse/jgit/util/FS;->factory:Lorg/eclipse/jgit/util/FS$FSFactory;

    invoke-virtual {v2, p0}, Lorg/eclipse/jgit/util/FS$FSFactory;->detect(Ljava/lang/Boolean;)Lorg/eclipse/jgit/util/FS;

    move-result-object v2

    return-object v2

    .line 139
    :catch_0
    move-exception v1

    .line 142
    .local v1, e:Ljava/lang/ClassNotFoundException;
    new-instance v2, Lorg/eclipse/jgit/util/FS$FSFactory;

    invoke-direct {v2}, Lorg/eclipse/jgit/util/FS$FSFactory;-><init>()V

    sput-object v2, Lorg/eclipse/jgit/util/FS;->factory:Lorg/eclipse/jgit/util/FS$FSFactory;

    goto :goto_0

    .line 143
    .end local v1           #e:Ljava/lang/ClassNotFoundException;
    :catch_1
    move-exception v1

    .line 144
    .local v1, e:Ljava/lang/UnsupportedClassVersionError;
    new-instance v2, Lorg/eclipse/jgit/util/FS$FSFactory;

    invoke-direct {v2}, Lorg/eclipse/jgit/util/FS$FSFactory;-><init>()V

    sput-object v2, Lorg/eclipse/jgit/util/FS;->factory:Lorg/eclipse/jgit/util/FS$FSFactory;

    goto :goto_0

    .line 145
    .end local v1           #e:Ljava/lang/UnsupportedClassVersionError;
    :catch_2
    move-exception v1

    .line 146
    .local v1, e:Ljava/lang/InstantiationException;
    new-instance v2, Lorg/eclipse/jgit/util/FS$FSFactory;

    invoke-direct {v2}, Lorg/eclipse/jgit/util/FS$FSFactory;-><init>()V

    sput-object v2, Lorg/eclipse/jgit/util/FS;->factory:Lorg/eclipse/jgit/util/FS$FSFactory;

    goto :goto_0

    .line 147
    .end local v1           #e:Ljava/lang/InstantiationException;
    :catch_3
    move-exception v1

    .line 148
    .local v1, e:Ljava/lang/IllegalAccessException;
    new-instance v2, Lorg/eclipse/jgit/util/FS$FSFactory;

    invoke-direct {v2}, Lorg/eclipse/jgit/util/FS$FSFactory;-><init>()V

    sput-object v2, Lorg/eclipse/jgit/util/FS;->factory:Lorg/eclipse/jgit/util/FS$FSFactory;

    goto :goto_0
.end method

.method protected static readPipe(Ljava/io/File;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 13
    .parameter "dir"
    .parameter "command"
    .parameter "encoding"

    .prologue
    const/4 v9, 0x0

    .line 408
    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v10

    const-string v11, "jgit.fs.debug"

    invoke-virtual {v10, v11}, Lorg/eclipse/jgit/util/SystemReader;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    .line 411
    .local v0, debug:Z
    if-eqz v0, :cond_0

    .line 412
    :try_start_0
    sget-object v10, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "readpipe "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ","

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 414
    :cond_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v10, p1, v11, p0}, Ljava/lang/Runtime;->exec([Ljava/lang/String;[Ljava/lang/String;Ljava/io/File;)Ljava/lang/Process;

    move-result-object v6

    .line 415
    .local v6, p:Ljava/lang/Process;
    new-instance v5, Ljava/io/BufferedReader;

    new-instance v10, Ljava/io/InputStreamReader;

    invoke-virtual {v6}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v11

    invoke-direct {v10, v11, p2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v5, v10}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 417
    .local v5, lineRead:Ljava/io/BufferedReader;
    invoke-virtual {v6}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v10

    invoke-virtual {v10}, Ljava/io/OutputStream;->close()V

    .line 418
    new-instance v3, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v10, 0x0

    invoke-direct {v3, v10}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 419
    .local v3, gooblerFail:Ljava/util/concurrent/atomic/AtomicBoolean;
    new-instance v2, Lorg/eclipse/jgit/util/FS$2;

    invoke-direct {v2, v6, v0, v3}, Lorg/eclipse/jgit/util/FS$2;-><init>(Ljava/lang/Process;ZLjava/util/concurrent/atomic/AtomicBoolean;)V

    .line 447
    .local v2, gobbler:Ljava/lang/Thread;
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 448
    const/4 v7, 0x0

    .line 450
    .local v7, r:Ljava/lang/String;
    :try_start_1
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v7

    .line 451
    if-eqz v0, :cond_1

    .line 452
    sget-object v10, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "readpipe may return \'"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "\'"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 453
    sget-object v10, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v11, "(ignoring remaing output:"

    invoke-virtual {v10, v11}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 456
    :cond_1
    :goto_0
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .local v4, l:Ljava/lang/String;
    if-eqz v4, :cond_5

    .line 457
    if-eqz v0, :cond_1

    .line 458
    sget-object v10, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v10, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 461
    .end local v4           #l:Ljava/lang/String;
    :catchall_0
    move-exception v10

    :try_start_2
    invoke-virtual {v6}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v11

    invoke-virtual {v11}, Ljava/io/InputStream;->close()V

    .line 462
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V

    throw v10
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 479
    .end local v2           #gobbler:Ljava/lang/Thread;
    .end local v3           #gooblerFail:Ljava/util/concurrent/atomic/AtomicBoolean;
    .end local v5           #lineRead:Ljava/io/BufferedReader;
    .end local v6           #p:Ljava/lang/Process;
    .end local v7           #r:Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 480
    .local v1, e:Ljava/io/IOException;
    if-eqz v0, :cond_2

    .line 481
    sget-object v10, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v10, v1}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    .line 484
    .end local v1           #e:Ljava/io/IOException;
    :cond_2
    :goto_1
    if-eqz v0, :cond_3

    .line 485
    sget-object v10, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v11, "readpipe returns null"

    invoke-virtual {v10, v11}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    :cond_3
    move-object v7, v9

    .line 486
    :cond_4
    return-object v7

    .line 461
    .restart local v2       #gobbler:Ljava/lang/Thread;
    .restart local v3       #gooblerFail:Ljava/util/concurrent/atomic/AtomicBoolean;
    .restart local v4       #l:Ljava/lang/String;
    .restart local v5       #lineRead:Ljava/io/BufferedReader;
    .restart local v6       #p:Ljava/lang/Process;
    .restart local v7       #r:Ljava/lang/String;
    :cond_5
    :try_start_3
    invoke-virtual {v6}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v10

    invoke-virtual {v10}, Ljava/io/InputStream;->close()V

    .line 462
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 467
    :goto_2
    :try_start_4
    invoke-virtual {v6}, Ljava/lang/Process;->waitFor()I

    move-result v8

    .line 468
    .local v8, rc:I
    invoke-virtual {v2}, Ljava/lang/Thread;->join()V

    .line 469
    if-nez v8, :cond_6

    if-eqz v7, :cond_6

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v10

    if-lez v10, :cond_6

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v10

    if-eqz v10, :cond_4

    .line 472
    :cond_6
    if-eqz v0, :cond_2

    .line 473
    sget-object v10, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "readpipe rc="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_1

    .line 475
    .end local v8           #rc:I
    :catch_1
    move-exception v10

    goto :goto_2
.end method

.method protected static varargs searchPath(Ljava/lang/String;[Ljava/lang/String;)Ljava/io/File;
    .locals 11
    .parameter "path"
    .parameter "lookFor"

    .prologue
    const/4 v9, 0x0

    .line 384
    if-nez p0, :cond_1

    .line 394
    :cond_0
    :goto_0
    return-object v9

    .line 387
    :cond_1
    sget-object v10, Ljava/io/File;->pathSeparator:Ljava/lang/String;

    invoke-virtual {p0, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .local v0, arr$:[Ljava/lang/String;
    array-length v6, v0

    .local v6, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    move v5, v4

    .end local v0           #arr$:[Ljava/lang/String;
    .end local v4           #i$:I
    .end local v6           #len$:I
    .local v5, i$:I
    :goto_1
    if-ge v5, v6, :cond_0

    aget-object v8, v0, v5

    .line 388
    .local v8, p:Ljava/lang/String;
    move-object v1, p1

    .local v1, arr$:[Ljava/lang/String;
    array-length v7, v1

    .local v7, len$:I
    const/4 v4, 0x0

    .end local v5           #i$:I
    .restart local v4       #i$:I
    :goto_2
    if-ge v4, v7, :cond_3

    aget-object v2, v1, v4

    .line 389
    .local v2, command:Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v8, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 390
    .local v3, e:Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result v10

    if-eqz v10, :cond_2

    .line 391
    invoke-virtual {v3}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v9

    goto :goto_0

    .line 388
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 387
    .end local v2           #command:Ljava/lang/String;
    .end local v3           #e:Ljava/io/File;
    :cond_3
    add-int/lit8 v4, v5, 0x1

    move v5, v4

    .end local v4           #i$:I
    .restart local v5       #i$:I
    goto :goto_1
.end method


# virtual methods
.method public abstract canExecute(Ljava/io/File;)Z
.end method

.method public createSymLink(Ljava/io/File;Ljava/lang/String;)V
    .locals 2
    .parameter "path"
    .parameter "target"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 612
    new-instance v0, Lorg/eclipse/jgit/errors/SymlinksNotSupportedException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->errorSymlinksNotSupported:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/SymlinksNotSupportedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public delete(Ljava/io/File;)V
    .locals 5
    .parameter "f"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 285
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_0

    .line 286
    new-instance v0, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->deleteFileFailed:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 288
    :cond_0
    return-void
.end method

.method protected abstract discoverGitPrefix()Ljava/io/File;
.end method

.method public exists(Ljava/io/File;)Z
    .locals 1
    .parameter "path"

    .prologue
    .line 551
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    return v0
.end method

.method public getAttributes(Ljava/io/File;)Lorg/eclipse/jgit/util/FS$Attributes;
    .locals 14
    .parameter "path"

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 772
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/util/FS;->isDirectory(Ljava/io/File;)Z

    move-result v4

    .line 773
    .local v4, isDirectory:Z
    if-nez v4, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_0

    move v7, v0

    .line 774
    .local v7, isFile:Z
    :goto_0
    sget-boolean v2, Lorg/eclipse/jgit/util/FS;->$assertionsDisabled:Z

    if-nez v2, :cond_1

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eq v2, v4, :cond_1

    if-nez v7, :cond_1

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .end local v7           #isFile:Z
    :cond_0
    move v7, v1

    .line 773
    goto :goto_0

    .line 775
    .restart local v7       #isFile:Z
    :cond_1
    if-nez v4, :cond_2

    if-eqz v7, :cond_3

    :cond_2
    move v3, v0

    .line 776
    .local v3, exists:Z
    :goto_1
    if-eqz v3, :cond_4

    if-nez v4, :cond_4

    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/util/FS;->canExecute(Ljava/io/File;)Z

    move-result v2

    if-eqz v2, :cond_4

    move v5, v0

    .line 777
    .local v5, canExecute:Z
    :goto_2
    const/4 v6, 0x0

    .line 778
    .local v6, isSymlink:Z
    if-eqz v3, :cond_5

    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v10

    .line 779
    .local v10, lastModified:J
    :goto_3
    const-wide/16 v8, 0x0

    .line 780
    .local v8, createTime:J
    new-instance v0, Lorg/eclipse/jgit/util/FS$Attributes;

    const-wide/16 v12, -0x1

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v0 .. v13}, Lorg/eclipse/jgit/util/FS$Attributes;-><init>(Lorg/eclipse/jgit/util/FS;Ljava/io/File;ZZZZZJJJ)V

    return-object v0

    .end local v3           #exists:Z
    .end local v5           #canExecute:Z
    .end local v6           #isSymlink:Z
    .end local v8           #createTime:J
    .end local v10           #lastModified:J
    :cond_3
    move v3, v1

    .line 775
    goto :goto_1

    .restart local v3       #exists:Z
    :cond_4
    move v5, v1

    .line 776
    goto :goto_2

    .line 778
    .restart local v5       #canExecute:Z
    .restart local v6       #isSymlink:Z
    :cond_5
    const-wide/16 v10, 0x0

    goto :goto_3
.end method

.method public gitPrefix()Ljava/io/File;
    .locals 4

    .prologue
    .line 491
    iget-object v1, p0, Lorg/eclipse/jgit/util/FS;->gitPrefix:Lorg/eclipse/jgit/util/FS$Holder;

    .line 492
    .local v1, p:Lorg/eclipse/jgit/util/FS$Holder;,"Lorg/eclipse/jgit/util/FS$Holder<Ljava/io/File;>;"
    if-nez v1, :cond_0

    .line 493
    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v2

    const-string v3, "jgit.gitprefix"

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/util/SystemReader;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 495
    .local v0, overrideGitPrefix:Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 496
    new-instance v1, Lorg/eclipse/jgit/util/FS$Holder;

    .end local v1           #p:Lorg/eclipse/jgit/util/FS$Holder;,"Lorg/eclipse/jgit/util/FS$Holder<Ljava/io/File;>;"
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/util/FS$Holder;-><init>(Ljava/lang/Object;)V

    .line 499
    .restart local v1       #p:Lorg/eclipse/jgit/util/FS$Holder;,"Lorg/eclipse/jgit/util/FS$Holder<Ljava/io/File;>;"
    :goto_0
    iput-object v1, p0, Lorg/eclipse/jgit/util/FS;->gitPrefix:Lorg/eclipse/jgit/util/FS$Holder;

    .line 501
    .end local v0           #overrideGitPrefix:Ljava/lang/String;
    :cond_0
    iget-object v2, v1, Lorg/eclipse/jgit/util/FS$Holder;->value:Ljava/lang/Object;

    check-cast v2, Ljava/io/File;

    return-object v2

    .line 498
    .restart local v0       #overrideGitPrefix:Ljava/lang/String;
    :cond_1
    new-instance v1, Lorg/eclipse/jgit/util/FS$Holder;

    .end local v1           #p:Lorg/eclipse/jgit/util/FS$Holder;,"Lorg/eclipse/jgit/util/FS$Holder<Ljava/io/File;>;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/FS;->discoverGitPrefix()Ljava/io/File;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/util/FS$Holder;-><init>(Ljava/lang/Object;)V

    .restart local v1       #p:Lorg/eclipse/jgit/util/FS$Holder;,"Lorg/eclipse/jgit/util/FS$Holder<Ljava/io/File;>;"
    goto :goto_0
.end method

.method public abstract isCaseSensitive()Z
.end method

.method public isDirectory(Ljava/io/File;)Z
    .locals 1
    .parameter "path"

    .prologue
    .line 563
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    return v0
.end method

.method public isFile(Ljava/io/File;)Z
    .locals 1
    .parameter "path"

    .prologue
    .line 575
    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v0

    return v0
.end method

.method public isHidden(Ljava/io/File;)Z
    .locals 1
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 586
    invoke-virtual {p1}, Ljava/io/File;->isHidden()Z

    move-result v0

    return v0
.end method

.method public isSymLink(Ljava/io/File;)Z
    .locals 1
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 539
    const/4 v0, 0x0

    return v0
.end method

.method public lastModified(Ljava/io/File;)J
    .locals 2
    .parameter "f"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 247
    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    return-wide v0
.end method

.method public length(Ljava/io/File;)J
    .locals 2
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 273
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v0

    return-wide v0
.end method

.method public abstract newInstance()Lorg/eclipse/jgit/util/FS;
.end method

.method public normalize(Ljava/io/File;)Ljava/io/File;
    .locals 0
    .parameter "file"

    .prologue
    .line 792
    return-object p1
.end method

.method public normalize(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "name"

    .prologue
    .line 803
    return-object p1
.end method

.method public readSymLink(Ljava/io/File;)Ljava/lang/String;
    .locals 2
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 528
    new-instance v0, Lorg/eclipse/jgit/errors/SymlinksNotSupportedException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->errorSymlinksNotSupported:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/SymlinksNotSupportedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public resolve(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
    .locals 2
    .parameter "dir"
    .parameter "name"

    .prologue
    .line 309
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 310
    .local v0, abspn:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isAbsolute()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 312
    .end local v0           #abspn:Ljava/io/File;
    :goto_0
    return-object v0

    .restart local v0       #abspn:Ljava/io/File;
    :cond_0
    new-instance v0, Ljava/io/File;

    .end local v0           #abspn:Ljava/io/File;
    invoke-direct {v0, p1, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public abstract retryFailedLockFileCommit()Z
.end method

.method public abstract runInShell(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/ProcessBuilder;
.end method

.method public abstract setExecute(Ljava/io/File;Z)Z
.end method

.method public setGitPrefix(Ljava/io/File;)Lorg/eclipse/jgit/util/FS;
    .locals 1
    .parameter "path"

    .prologue
    .line 515
    new-instance v0, Lorg/eclipse/jgit/util/FS$Holder;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/util/FS$Holder;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lorg/eclipse/jgit/util/FS;->gitPrefix:Lorg/eclipse/jgit/util/FS$Holder;

    .line 516
    return-object p0
.end method

.method public setHidden(Ljava/io/File;Z)V
    .locals 2
    .parameter "path"
    .parameter "hidden"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 598
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 599
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Hiding only allowed for names that start with a period"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 601
    :cond_0
    return-void
.end method

.method public setLastModified(Ljava/io/File;J)V
    .locals 0
    .parameter "f"
    .parameter "time"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 260
    invoke-virtual {p1, p2, p3}, Ljava/io/File;->setLastModified(J)Z

    .line 261
    return-void
.end method

.method public setUserHome(Ljava/io/File;)Lorg/eclipse/jgit/util/FS;
    .locals 1
    .parameter "path"

    .prologue
    .line 344
    new-instance v0, Lorg/eclipse/jgit/util/FS$Holder;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/util/FS$Holder;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lorg/eclipse/jgit/util/FS;->userHome:Lorg/eclipse/jgit/util/FS$Holder;

    .line 345
    return-object p0
.end method

.method public abstract supportsExecute()Z
.end method

.method public supportsSymlinks()Z
    .locals 1

    .prologue
    .line 195
    const/4 v0, 0x0

    return v0
.end method

.method public userHome()Ljava/io/File;
    .locals 2

    .prologue
    .line 327
    iget-object v0, p0, Lorg/eclipse/jgit/util/FS;->userHome:Lorg/eclipse/jgit/util/FS$Holder;

    .line 328
    .local v0, p:Lorg/eclipse/jgit/util/FS$Holder;,"Lorg/eclipse/jgit/util/FS$Holder<Ljava/io/File;>;"
    if-nez v0, :cond_0

    .line 329
    new-instance v0, Lorg/eclipse/jgit/util/FS$Holder;

    .end local v0           #p:Lorg/eclipse/jgit/util/FS$Holder;,"Lorg/eclipse/jgit/util/FS$Holder<Ljava/io/File;>;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/FS;->userHomeImpl()Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/util/FS$Holder;-><init>(Ljava/lang/Object;)V

    .line 330
    .restart local v0       #p:Lorg/eclipse/jgit/util/FS$Holder;,"Lorg/eclipse/jgit/util/FS$Holder<Ljava/io/File;>;"
    iput-object v0, p0, Lorg/eclipse/jgit/util/FS;->userHome:Lorg/eclipse/jgit/util/FS$Holder;

    .line 332
    :cond_0
    iget-object v1, v0, Lorg/eclipse/jgit/util/FS$Holder;->value:Ljava/lang/Object;

    check-cast v1, Ljava/io/File;

    return-object v1
.end method

.method protected userHomeImpl()Ljava/io/File;
    .locals 2

    .prologue
    .line 361
    new-instance v1, Lorg/eclipse/jgit/util/FS$1;

    invoke-direct {v1, p0}, Lorg/eclipse/jgit/util/FS$1;-><init>(Lorg/eclipse/jgit/util/FS;)V

    invoke-static {v1}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 367
    .local v0, home:Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 368
    :cond_0
    const/4 v1, 0x0

    .line 369
    :goto_0
    return-object v1

    :cond_1
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v1

    goto :goto_0
.end method
