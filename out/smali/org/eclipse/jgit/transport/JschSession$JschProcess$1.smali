.class Lorg/eclipse/jgit/transport/JschSession$JschProcess$1;
.super Ljava/io/PipedOutputStream;
.source "JschSession.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/transport/JschSession$JschProcess;->setupStreams()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/eclipse/jgit/transport/JschSession$JschProcess;

.field final synthetic val$copier:Lorg/eclipse/jgit/util/io/StreamCopyThread;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/JschSession$JschProcess;Ljava/io/PipedInputStream;Lorg/eclipse/jgit/util/io/StreamCopyThread;)V
    .locals 0
    .parameter
    .parameter "x0"
    .parameter

    .prologue
    .line 173
    iput-object p1, p0, Lorg/eclipse/jgit/transport/JschSession$JschProcess$1;->this$1:Lorg/eclipse/jgit/transport/JschSession$JschProcess;

    iput-object p3, p0, Lorg/eclipse/jgit/transport/JschSession$JschProcess$1;->val$copier:Lorg/eclipse/jgit/util/io/StreamCopyThread;

    invoke-direct {p0, p2}, Ljava/io/PipedOutputStream;-><init>(Ljava/io/PipedInputStream;)V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 182
    invoke-super {p0}, Ljava/io/PipedOutputStream;->close()V

    .line 184
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/JschSession$JschProcess$1;->val$copier:Lorg/eclipse/jgit/util/io/StreamCopyThread;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/JschSession$JschProcess$1;->this$1:Lorg/eclipse/jgit/transport/JschSession$JschProcess;

    #getter for: Lorg/eclipse/jgit/transport/JschSession$JschProcess;->timeout:I
    invoke-static {v1}, Lorg/eclipse/jgit/transport/JschSession$JschProcess;->access$300(Lorg/eclipse/jgit/transport/JschSession$JschProcess;)I

    move-result v1

    mul-int/lit16 v1, v1, 0x3e8

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/util/io/StreamCopyThread;->join(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 189
    :goto_0
    return-void

    .line 185
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 176
    invoke-super {p0}, Ljava/io/PipedOutputStream;->flush()V

    .line 177
    iget-object v0, p0, Lorg/eclipse/jgit/transport/JschSession$JschProcess$1;->val$copier:Lorg/eclipse/jgit/util/io/StreamCopyThread;

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/io/StreamCopyThread;->flush()V

    .line 178
    return-void
.end method
