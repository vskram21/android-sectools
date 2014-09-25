.class Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection$1;
.super Ljava/lang/Thread;
.source "TransportLocal.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection;-><init>(Lorg/eclipse/jgit/transport/TransportLocal;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection;

.field final synthetic val$dst:Lorg/eclipse/jgit/lib/Repository;

.field final synthetic val$in_w:Ljava/io/PipedOutputStream;

.field final synthetic val$out_r:Ljava/io/PipedInputStream;

.field final synthetic val$this$0:Lorg/eclipse/jgit/transport/TransportLocal;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection;Ljava/lang/String;Lorg/eclipse/jgit/transport/TransportLocal;Lorg/eclipse/jgit/lib/Repository;Ljava/io/PipedInputStream;Ljava/io/PipedOutputStream;)V
    .locals 0
    .parameter
    .parameter "x0"
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 386
    iput-object p1, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection$1;->this$1:Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection;

    iput-object p3, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection$1;->val$this$0:Lorg/eclipse/jgit/transport/TransportLocal;

    iput-object p4, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection$1;->val$dst:Lorg/eclipse/jgit/lib/Repository;

    iput-object p5, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection$1;->val$out_r:Ljava/io/PipedInputStream;

    iput-object p6, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection$1;->val$in_w:Ljava/io/PipedOutputStream;

    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 389
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection$1;->this$1:Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection;

    iget-object v1, v1, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection;->this$0:Lorg/eclipse/jgit/transport/TransportLocal;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection$1;->val$dst:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/transport/TransportLocal;->createReceivePack(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/transport/ReceivePack;

    move-result-object v0

    .line 390
    .local v0, rp:Lorg/eclipse/jgit/transport/ReceivePack;
    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection$1;->val$out_r:Ljava/io/PipedInputStream;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection$1;->val$in_w:Ljava/io/PipedOutputStream;

    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0, v1, v2, v3}, Lorg/eclipse/jgit/transport/ReceivePack;->receive(Ljava/io/InputStream;Ljava/io/OutputStream;Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    .line 397
    :try_start_1
    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection$1;->val$out_r:Ljava/io/PipedInputStream;

    invoke-virtual {v1}, Ljava/io/PipedInputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_9

    .line 403
    :goto_0
    :try_start_2
    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection$1;->val$in_w:Ljava/io/PipedOutputStream;

    invoke-virtual {v1}, Ljava/io/PipedOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_8

    .line 408
    :goto_1
    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection$1;->val$dst:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/Repository;->close()V

    .line 410
    .end local v0           #rp:Lorg/eclipse/jgit/transport/ReceivePack;
    :goto_2
    return-void

    .line 391
    :catch_0
    move-exception v1

    .line 397
    :try_start_3
    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection$1;->val$out_r:Ljava/io/PipedInputStream;

    invoke-virtual {v1}, Ljava/io/PipedInputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_7

    .line 403
    :goto_3
    :try_start_4
    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection$1;->val$in_w:Ljava/io/PipedOutputStream;

    invoke-virtual {v1}, Ljava/io/PipedOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_6

    .line 408
    :goto_4
    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection$1;->val$dst:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/Repository;->close()V

    goto :goto_2

    .line 393
    :catch_1
    move-exception v1

    .line 397
    :try_start_5
    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection$1;->val$out_r:Ljava/io/PipedInputStream;

    invoke-virtual {v1}, Ljava/io/PipedInputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_5

    .line 403
    :goto_5
    :try_start_6
    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection$1;->val$in_w:Ljava/io/PipedOutputStream;

    invoke-virtual {v1}, Ljava/io/PipedOutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    .line 408
    :goto_6
    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection$1;->val$dst:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/Repository;->close()V

    goto :goto_2

    .line 396
    :catchall_0
    move-exception v1

    .line 397
    :try_start_7
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection$1;->val$out_r:Ljava/io/PipedInputStream;

    invoke-virtual {v2}, Ljava/io/PipedInputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3

    .line 403
    :goto_7
    :try_start_8
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection$1;->val$in_w:Ljava/io/PipedOutputStream;

    invoke-virtual {v2}, Ljava/io/PipedOutputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_2

    .line 408
    :goto_8
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalPushConnection$1;->val$dst:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/Repository;->close()V

    throw v1

    .line 404
    :catch_2
    move-exception v2

    goto :goto_8

    .line 398
    :catch_3
    move-exception v2

    goto :goto_7

    .line 404
    :catch_4
    move-exception v1

    goto :goto_6

    .line 398
    :catch_5
    move-exception v1

    goto :goto_5

    .line 404
    :catch_6
    move-exception v1

    goto :goto_4

    .line 398
    :catch_7
    move-exception v1

    goto :goto_3

    .line 404
    .restart local v0       #rp:Lorg/eclipse/jgit/transport/ReceivePack;
    :catch_8
    move-exception v1

    goto :goto_1

    .line 398
    :catch_9
    move-exception v1

    goto :goto_0
.end method
