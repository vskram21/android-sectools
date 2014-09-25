.class Lorg/eclipse/jgit/transport/Daemon$5;
.super Ljava/lang/Thread;
.source "Daemon.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/transport/Daemon;->start()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/transport/Daemon;

.field final synthetic val$listenSock:Ljava/net/ServerSocket;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/Daemon;Ljava/lang/ThreadGroup;Ljava/lang/String;Ljava/net/ServerSocket;)V
    .locals 0
    .parameter
    .parameter "x0"
    .parameter "x1"
    .parameter

    .prologue
    .line 289
    iput-object p1, p0, Lorg/eclipse/jgit/transport/Daemon$5;->this$0:Lorg/eclipse/jgit/transport/Daemon;

    iput-object p4, p0, Lorg/eclipse/jgit/transport/Daemon$5;->val$listenSock:Ljava/net/ServerSocket;

    invoke-direct {p0, p2, p3}, Ljava/lang/Thread;-><init>(Ljava/lang/ThreadGroup;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 291
    :goto_0
    iget-object v1, p0, Lorg/eclipse/jgit/transport/Daemon$5;->this$0:Lorg/eclipse/jgit/transport/Daemon;

    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/Daemon;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 293
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jgit/transport/Daemon$5;->this$0:Lorg/eclipse/jgit/transport/Daemon;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/Daemon$5;->val$listenSock:Ljava/net/ServerSocket;

    invoke-virtual {v2}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v2

    #calls: Lorg/eclipse/jgit/transport/Daemon;->startClient(Ljava/net/Socket;)V
    invoke-static {v1, v2}, Lorg/eclipse/jgit/transport/Daemon;->access$200(Lorg/eclipse/jgit/transport/Daemon;Ljava/net/Socket;)V
    :try_end_0
    .catch Ljava/io/InterruptedIOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 294
    :catch_0
    move-exception v1

    goto :goto_0

    .line 296
    :catch_1
    move-exception v0

    .line 302
    :cond_0
    :try_start_1
    iget-object v1, p0, Lorg/eclipse/jgit/transport/Daemon$5;->val$listenSock:Ljava/net/ServerSocket;

    invoke-virtual {v1}, Ljava/net/ServerSocket;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 306
    iget-object v2, p0, Lorg/eclipse/jgit/transport/Daemon$5;->this$0:Lorg/eclipse/jgit/transport/Daemon;

    monitor-enter v2

    .line 307
    :try_start_2
    iget-object v1, p0, Lorg/eclipse/jgit/transport/Daemon$5;->this$0:Lorg/eclipse/jgit/transport/Daemon;

    const/4 v3, 0x0

    #setter for: Lorg/eclipse/jgit/transport/Daemon;->acceptThread:Ljava/lang/Thread;
    invoke-static {v1, v3}, Lorg/eclipse/jgit/transport/Daemon;->access$302(Lorg/eclipse/jgit/transport/Daemon;Ljava/lang/Thread;)Ljava/lang/Thread;

    .line 308
    monitor-exit v2

    .line 310
    :goto_1
    return-void

    .line 308
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    .line 303
    :catch_2
    move-exception v1

    .line 306
    iget-object v2, p0, Lorg/eclipse/jgit/transport/Daemon$5;->this$0:Lorg/eclipse/jgit/transport/Daemon;

    monitor-enter v2

    .line 307
    :try_start_3
    iget-object v1, p0, Lorg/eclipse/jgit/transport/Daemon$5;->this$0:Lorg/eclipse/jgit/transport/Daemon;

    const/4 v3, 0x0

    #setter for: Lorg/eclipse/jgit/transport/Daemon;->acceptThread:Ljava/lang/Thread;
    invoke-static {v1, v3}, Lorg/eclipse/jgit/transport/Daemon;->access$302(Lorg/eclipse/jgit/transport/Daemon;Ljava/lang/Thread;)Ljava/lang/Thread;

    .line 308
    monitor-exit v2

    goto :goto_1

    :catchall_1
    move-exception v1

    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v1

    .line 306
    :catchall_2
    move-exception v1

    iget-object v2, p0, Lorg/eclipse/jgit/transport/Daemon$5;->this$0:Lorg/eclipse/jgit/transport/Daemon;

    monitor-enter v2

    .line 307
    :try_start_4
    iget-object v3, p0, Lorg/eclipse/jgit/transport/Daemon$5;->this$0:Lorg/eclipse/jgit/transport/Daemon;

    const/4 v4, 0x0

    #setter for: Lorg/eclipse/jgit/transport/Daemon;->acceptThread:Ljava/lang/Thread;
    invoke-static {v3, v4}, Lorg/eclipse/jgit/transport/Daemon;->access$302(Lorg/eclipse/jgit/transport/Daemon;Ljava/lang/Thread;)Ljava/lang/Thread;

    .line 308
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    throw v1

    :catchall_3
    move-exception v1

    :try_start_5
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    throw v1
.end method
