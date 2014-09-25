.class Lorg/eclipse/jgit/transport/Daemon$6;
.super Ljava/lang/Thread;
.source "Daemon.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/transport/Daemon;->startClient(Ljava/net/Socket;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/transport/Daemon;

.field final synthetic val$dc:Lorg/eclipse/jgit/transport/DaemonClient;

.field final synthetic val$s:Ljava/net/Socket;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/Daemon;Ljava/lang/ThreadGroup;Ljava/lang/String;Lorg/eclipse/jgit/transport/DaemonClient;Ljava/net/Socket;)V
    .locals 0
    .parameter
    .parameter "x0"
    .parameter "x1"
    .parameter
    .parameter

    .prologue
    .line 335
    iput-object p1, p0, Lorg/eclipse/jgit/transport/Daemon$6;->this$0:Lorg/eclipse/jgit/transport/Daemon;

    iput-object p4, p0, Lorg/eclipse/jgit/transport/Daemon$6;->val$dc:Lorg/eclipse/jgit/transport/DaemonClient;

    iput-object p5, p0, Lorg/eclipse/jgit/transport/Daemon$6;->val$s:Ljava/net/Socket;

    invoke-direct {p0, p2, p3}, Ljava/lang/Thread;-><init>(Ljava/lang/ThreadGroup;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 338
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/Daemon$6;->val$dc:Lorg/eclipse/jgit/transport/DaemonClient;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/Daemon$6;->val$s:Ljava/net/Socket;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/transport/DaemonClient;->execute(Ljava/net/Socket;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Lorg/eclipse/jgit/transport/resolver/ServiceNotEnabledException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/eclipse/jgit/transport/resolver/ServiceNotAuthorizedException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4

    .line 347
    :try_start_1
    iget-object v0, p0, Lorg/eclipse/jgit/transport/Daemon$6;->val$s:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_c

    .line 352
    :goto_0
    :try_start_2
    iget-object v0, p0, Lorg/eclipse/jgit/transport/Daemon$6;->val$s:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_b

    .line 357
    :goto_1
    return-void

    .line 339
    :catch_0
    move-exception v0

    .line 347
    :try_start_3
    iget-object v0, p0, Lorg/eclipse/jgit/transport/Daemon$6;->val$s:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_a

    .line 352
    :goto_2
    :try_start_4
    iget-object v0, p0, Lorg/eclipse/jgit/transport/Daemon$6;->val$s:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_1

    .line 353
    :catch_1
    move-exception v0

    goto :goto_1

    .line 341
    :catch_2
    move-exception v0

    .line 347
    :try_start_5
    iget-object v0, p0, Lorg/eclipse/jgit/transport/Daemon$6;->val$s:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_9

    .line 352
    :goto_3
    :try_start_6
    iget-object v0, p0, Lorg/eclipse/jgit/transport/Daemon$6;->val$s:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    goto :goto_1

    .line 353
    :catch_3
    move-exception v0

    goto :goto_1

    .line 343
    :catch_4
    move-exception v0

    .line 347
    :try_start_7
    iget-object v0, p0, Lorg/eclipse/jgit/transport/Daemon$6;->val$s:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_8

    .line 352
    :goto_4
    :try_start_8
    iget-object v0, p0, Lorg/eclipse/jgit/transport/Daemon$6;->val$s:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_5

    goto :goto_1

    .line 353
    :catch_5
    move-exception v0

    goto :goto_1

    .line 346
    :catchall_0
    move-exception v0

    .line 347
    :try_start_9
    iget-object v1, p0, Lorg/eclipse/jgit/transport/Daemon$6;->val$s:Ljava/net/Socket;

    invoke-virtual {v1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_7

    .line 352
    :goto_5
    :try_start_a
    iget-object v1, p0, Lorg/eclipse/jgit/transport/Daemon$6;->val$s:Ljava/net/Socket;

    invoke-virtual {v1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_6

    .line 355
    :goto_6
    throw v0

    .line 353
    :catch_6
    move-exception v1

    goto :goto_6

    .line 348
    :catch_7
    move-exception v1

    goto :goto_5

    :catch_8
    move-exception v0

    goto :goto_4

    :catch_9
    move-exception v0

    goto :goto_3

    :catch_a
    move-exception v0

    goto :goto_2

    .line 353
    :catch_b
    move-exception v0

    goto :goto_1

    .line 348
    :catch_c
    move-exception v0

    goto :goto_0
.end method
