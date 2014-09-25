.class Lorg/eclipse/jgit/internal/storage/file/RefDirectory$1;
.super Lorg/eclipse/jgit/lib/RefWriter;
.source "RefDirectory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->commitPackedRefs(Lorg/eclipse/jgit/internal/storage/file/LockFile;Lorg/eclipse/jgit/util/RefList;Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

.field final synthetic val$lck:Lorg/eclipse/jgit/internal/storage/file/LockFile;

.field final synthetic val$oldPackedList:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;

.field final synthetic val$refs:Lorg/eclipse/jgit/util/RefList;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/RefDirectory;Lorg/eclipse/jgit/util/RefList;Lorg/eclipse/jgit/internal/storage/file/LockFile;Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;Lorg/eclipse/jgit/util/RefList;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 826
    .local p2, x0:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/lib/Ref;>;"
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$1;->this$0:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    iput-object p3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$1;->val$lck:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    iput-object p4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$1;->val$oldPackedList:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;

    iput-object p5, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$1;->val$refs:Lorg/eclipse/jgit/util/RefList;

    invoke-direct {p0, p2}, Lorg/eclipse/jgit/lib/RefWriter;-><init>(Lorg/eclipse/jgit/util/RefList;)V

    return-void
.end method


# virtual methods
.method protected writeFile(Ljava/lang/String;[B)V
    .locals 9
    .parameter "name"
    .parameter "content"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 830
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$1;->val$lck:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    invoke-virtual {v3, v5}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->setFSync(Z)V

    .line 831
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$1;->val$lck:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    invoke-virtual {v3, v5}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->setNeedSnapshot(Z)V

    .line 833
    :try_start_0
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$1;->val$lck:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    invoke-virtual {v3, p2}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->write([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 838
    :try_start_1
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$1;->val$lck:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->waitForStatChange()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    .line 843
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$1;->val$lck:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->commit()Z

    move-result v3

    if-nez v3, :cond_0

    .line 844
    new-instance v3, Lorg/eclipse/jgit/errors/ObjectWritingException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->unableToWrite:Ljava/lang/String;

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p1, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/errors/ObjectWritingException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 834
    :catch_0
    move-exception v2

    .line 835
    .local v2, ioe:Ljava/io/IOException;
    new-instance v3, Lorg/eclipse/jgit/errors/ObjectWritingException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->unableToWrite:Ljava/lang/String;

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p1, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Lorg/eclipse/jgit/errors/ObjectWritingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 839
    .end local v2           #ioe:Ljava/io/IOException;
    :catch_1
    move-exception v1

    .line 840
    .local v1, e:Ljava/lang/InterruptedException;
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$1;->val$lck:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->unlock()V

    .line 841
    new-instance v3, Lorg/eclipse/jgit/errors/ObjectWritingException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->interruptedWriting:Ljava/lang/String;

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p1, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/errors/ObjectWritingException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 846
    .end local v1           #e:Ljava/lang/InterruptedException;
    :cond_0
    invoke-static {}, Lorg/eclipse/jgit/lib/Constants;->newMessageDigest()Ljava/security/MessageDigest;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v0

    .line 847
    .local v0, digest:[B
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$1;->this$0:Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    #getter for: Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->packedRefs:Ljava/util/concurrent/atomic/AtomicReference;
    invoke-static {v3}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->access$200(Lorg/eclipse/jgit/internal/storage/file/RefDirectory;)Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v3

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$1;->val$oldPackedList:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;

    new-instance v5, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;

    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$1;->val$refs:Lorg/eclipse/jgit/util/RefList;

    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$1;->val$lck:Lorg/eclipse/jgit/internal/storage/file/LockFile;

    invoke-virtual {v7}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->getCommitSnapshot()Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    move-result-object v7

    invoke-static {v0}, Lorg/eclipse/jgit/lib/ObjectId;->fromRaw([B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v8

    invoke-direct {v5, v6, v7, v8}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;-><init>(Lorg/eclipse/jgit/util/RefList;Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;Lorg/eclipse/jgit/lib/ObjectId;)V

    invoke-virtual {v3, v4, v5}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 849
    return-void
.end method
