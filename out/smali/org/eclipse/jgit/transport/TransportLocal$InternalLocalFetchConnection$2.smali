.class Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection$2;
.super Ljava/lang/Thread;
.source "TransportLocal.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection;-><init>(Lorg/eclipse/jgit/transport/TransportLocal;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection;

.field final synthetic val$dst:Lorg/eclipse/jgit/lib/Repository;

.field final synthetic val$in_w:Ljava/io/PipedOutputStream;

.field final synthetic val$out_r:Ljava/io/PipedInputStream;

.field final synthetic val$this$0:Lorg/eclipse/jgit/transport/TransportLocal;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection;Ljava/lang/String;Lorg/eclipse/jgit/transport/TransportLocal;Lorg/eclipse/jgit/lib/Repository;Ljava/io/PipedInputStream;Ljava/io/PipedOutputStream;)V
    .locals 0
    .parameter
    .parameter "x0"
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 254
    iput-object p1, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection$2;->this$1:Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection;

    iput-object p3, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection$2;->val$this$0:Lorg/eclipse/jgit/transport/TransportLocal;

    iput-object p4, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection$2;->val$dst:Lorg/eclipse/jgit/lib/Repository;

    iput-object p5, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection$2;->val$out_r:Ljava/io/PipedInputStream;

    iput-object p6, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection$2;->val$in_w:Ljava/io/PipedOutputStream;

    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 257
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection$2;->this$1:Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection;

    iget-object v2, v2, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection;->this$0:Lorg/eclipse/jgit/transport/TransportLocal;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection$2;->val$dst:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/transport/TransportLocal;->createUploadPack(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/transport/UploadPack;

    move-result-object v1

    .line 258
    .local v1, rp:Lorg/eclipse/jgit/transport/UploadPack;
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection$2;->val$out_r:Ljava/io/PipedInputStream;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection$2;->val$in_w:Ljava/io/PipedOutputStream;

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v3, v4}, Lorg/eclipse/jgit/transport/UploadPack;->upload(Ljava/io/InputStream;Ljava/io/OutputStream;Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    .line 267
    :try_start_1
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection$2;->val$out_r:Ljava/io/PipedInputStream;

    invoke-virtual {v2}, Ljava/io/PipedInputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_9

    .line 273
    :goto_0
    :try_start_2
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection$2;->val$in_w:Ljava/io/PipedOutputStream;

    invoke-virtual {v2}, Ljava/io/PipedOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_8

    .line 278
    :goto_1
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection$2;->val$dst:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/Repository;->close()V

    .line 280
    .end local v1           #rp:Lorg/eclipse/jgit/transport/UploadPack;
    :goto_2
    return-void

    .line 259
    :catch_0
    move-exception v0

    .line 261
    .local v0, err:Ljava/io/IOException;
    :try_start_3
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 267
    :try_start_4
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection$2;->val$out_r:Ljava/io/PipedInputStream;

    invoke-virtual {v2}, Ljava/io/PipedInputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_7

    .line 273
    :goto_3
    :try_start_5
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection$2;->val$in_w:Ljava/io/PipedOutputStream;

    invoke-virtual {v2}, Ljava/io/PipedOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_6

    .line 278
    :goto_4
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection$2;->val$dst:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/Repository;->close()V

    goto :goto_2

    .line 262
    .end local v0           #err:Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 264
    .local v0, err:Ljava/lang/RuntimeException;
    :try_start_6
    invoke-virtual {v0}, Ljava/lang/RuntimeException;->printStackTrace()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 267
    :try_start_7
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection$2;->val$out_r:Ljava/io/PipedInputStream;

    invoke-virtual {v2}, Ljava/io/PipedInputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_5

    .line 273
    :goto_5
    :try_start_8
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection$2;->val$in_w:Ljava/io/PipedOutputStream;

    invoke-virtual {v2}, Ljava/io/PipedOutputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_4

    .line 278
    :goto_6
    iget-object v2, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection$2;->val$dst:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/Repository;->close()V

    goto :goto_2

    .line 266
    .end local v0           #err:Ljava/lang/RuntimeException;
    :catchall_0
    move-exception v2

    .line 267
    :try_start_9
    iget-object v3, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection$2;->val$out_r:Ljava/io/PipedInputStream;

    invoke-virtual {v3}, Ljava/io/PipedInputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_3

    .line 273
    :goto_7
    :try_start_a
    iget-object v3, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection$2;->val$in_w:Ljava/io/PipedOutputStream;

    invoke-virtual {v3}, Ljava/io/PipedOutputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_2

    .line 278
    :goto_8
    iget-object v3, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection$2;->val$dst:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/Repository;->close()V

    throw v2

    .line 274
    :catch_2
    move-exception v3

    goto :goto_8

    .line 268
    :catch_3
    move-exception v3

    goto :goto_7

    .line 274
    .restart local v0       #err:Ljava/lang/RuntimeException;
    :catch_4
    move-exception v2

    goto :goto_6

    .line 268
    :catch_5
    move-exception v2

    goto :goto_5

    .line 274
    .local v0, err:Ljava/io/IOException;
    :catch_6
    move-exception v2

    goto :goto_4

    .line 268
    :catch_7
    move-exception v2

    goto :goto_3

    .line 274
    .end local v0           #err:Ljava/io/IOException;
    .restart local v1       #rp:Lorg/eclipse/jgit/transport/UploadPack;
    :catch_8
    move-exception v2

    goto :goto_1

    .line 268
    :catch_9
    move-exception v2

    goto :goto_0
.end method
