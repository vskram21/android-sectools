.class Lorg/eclipse/jgit/internal/storage/file/LockFile$2;
.super Ljava/io/OutputStream;
.source "LockFile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/internal/storage/file/LockFile;->getOutputStream()Ljava/io/OutputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/internal/storage/file/LockFile;

.field final synthetic val$out:Ljava/io/OutputStream;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/LockFile;Ljava/io/OutputStream;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 323
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile$2;->this$0:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile$2;->val$out:Ljava/io/OutputStream;

    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

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
    .line 343
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile$2;->this$0:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/LockFile;->fsync:Z
    invoke-static {v1}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->access$000(Lorg/eclipse/jgit/internal/storage/file/LockFile;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 344
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile$2;->this$0:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/LockFile;->os:Ljava/io/FileOutputStream;
    invoke-static {v1}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->access$100(Lorg/eclipse/jgit/internal/storage/file/LockFile;)Ljava/io/FileOutputStream;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/nio/channels/FileChannel;->force(Z)V

    .line 345
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile$2;->val$out:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 346
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile$2;->this$0:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    const/4 v2, 0x0

    #setter for: Lorg/eclipse/jgit/internal/storage/file/LockFile;->os:Ljava/io/FileOutputStream;
    invoke-static {v1, v2}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->access$102(Lorg/eclipse/jgit/internal/storage/file/LockFile;Ljava/io/FileOutputStream;)Ljava/io/FileOutputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_2

    .line 357
    return-void

    .line 347
    :catch_0
    move-exception v0

    .line 348
    .local v0, ioe:Ljava/io/IOException;
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile$2;->this$0:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->unlock()V

    .line 349
    throw v0

    .line 350
    .end local v0           #ioe:Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 351
    .local v0, ioe:Ljava/lang/RuntimeException;
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile$2;->this$0:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->unlock()V

    .line 352
    throw v0

    .line 353
    .end local v0           #ioe:Ljava/lang/RuntimeException;
    :catch_2
    move-exception v0

    .line 354
    .local v0, ioe:Ljava/lang/Error;
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile$2;->this$0:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->unlock()V

    .line 355
    throw v0
.end method

.method public write(I)V
    .locals 1
    .parameter "b"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 337
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile$2;->val$out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 338
    return-void
.end method

.method public write([B)V
    .locals 1
    .parameter "b"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 332
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile$2;->val$out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 333
    return-void
.end method

.method public write([BII)V
    .locals 1
    .parameter "b"
    .parameter "o"
    .parameter "n"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 327
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/LockFile$2;->val$out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 328
    return-void
.end method
