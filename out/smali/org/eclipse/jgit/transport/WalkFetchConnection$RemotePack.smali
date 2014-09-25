.class Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;
.super Ljava/lang/Object;
.source "WalkFetchConnection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/WalkFetchConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RemotePack"
.end annotation


# instance fields
.field final connection:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;

.field final idxName:Ljava/lang/String;

.field index:Lorg/eclipse/jgit/internal/storage/file/PackIndex;

.field final packName:Ljava/lang/String;

.field final synthetic this$0:Lorg/eclipse/jgit/transport/WalkFetchConnection;

.field tmpIdx:Ljava/io/File;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/WalkFetchConnection;Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;Ljava/lang/String;)V
    .locals 5
    .parameter
    .parameter "c"
    .parameter "pn"

    .prologue
    const/4 v4, 0x0

    .line 800
    iput-object p1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->this$0:Lorg/eclipse/jgit/transport/WalkFetchConnection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 801
    iput-object p2, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->connection:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;

    .line 802
    iput-object p3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->packName:Ljava/lang/String;

    .line 803
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->packName:Ljava/lang/String;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->packName:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x5

    invoke-virtual {v2, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".idx"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->idxName:Ljava/lang/String;

    .line 805
    iget-object v0, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->idxName:Ljava/lang/String;

    .line 806
    .local v0, tn:Ljava/lang/String;
    const-string v1, "pack-"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 807
    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 808
    :cond_0
    const-string v1, ".idx"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 809
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x4

    invoke-virtual {v0, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 811
    :cond_1
    #getter for: Lorg/eclipse/jgit/transport/WalkFetchConnection;->local:Lorg/eclipse/jgit/lib/Repository;
    invoke-static {p1}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->access$000(Lorg/eclipse/jgit/transport/WalkFetchConnection;)Lorg/eclipse/jgit/lib/Repository;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/Repository;->getObjectDatabase()Lorg/eclipse/jgit/lib/ObjectDatabase;

    move-result-object v1

    instance-of v1, v1, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    if-eqz v1, :cond_2

    .line 812
    new-instance v2, Ljava/io/File;

    #getter for: Lorg/eclipse/jgit/transport/WalkFetchConnection;->local:Lorg/eclipse/jgit/lib/Repository;
    invoke-static {p1}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->access$000(Lorg/eclipse/jgit/transport/WalkFetchConnection;)Lorg/eclipse/jgit/lib/Repository;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/Repository;->getObjectDatabase()Lorg/eclipse/jgit/lib/ObjectDatabase;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->getDirectory()Ljava/io/File;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "walk-"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".walkidx"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v2, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->tmpIdx:Ljava/io/File;

    .line 816
    :cond_2
    return-void
.end method


# virtual methods
.method downloadPack(Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    .locals 6
    .parameter "monitor"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 871
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "pack/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->packName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 872
    .local v1, name:Ljava/lang/String;
    iget-object v4, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->connection:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;

    invoke-virtual {v4, v1}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->open(Ljava/lang/String;)Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;

    move-result-object v3

    .line 873
    .local v3, s:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;
    iget-object v4, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->this$0:Lorg/eclipse/jgit/transport/WalkFetchConnection;

    #getter for: Lorg/eclipse/jgit/transport/WalkFetchConnection;->inserter:Lorg/eclipse/jgit/lib/ObjectInserter;
    invoke-static {v4}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->access$100(Lorg/eclipse/jgit/transport/WalkFetchConnection;)Lorg/eclipse/jgit/lib/ObjectInserter;

    move-result-object v4

    iget-object v5, v3, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;->in:Ljava/io/InputStream;

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/lib/ObjectInserter;->newPackParser(Ljava/io/InputStream;)Lorg/eclipse/jgit/transport/PackParser;

    move-result-object v2

    .line 874
    .local v2, parser:Lorg/eclipse/jgit/transport/PackParser;
    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Lorg/eclipse/jgit/transport/PackParser;->setAllowThin(Z)V

    .line 875
    iget-object v4, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->this$0:Lorg/eclipse/jgit/transport/WalkFetchConnection;

    #getter for: Lorg/eclipse/jgit/transport/WalkFetchConnection;->objCheck:Lorg/eclipse/jgit/lib/ObjectChecker;
    invoke-static {v4}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->access$200(Lorg/eclipse/jgit/transport/WalkFetchConnection;)Lorg/eclipse/jgit/lib/ObjectChecker;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/eclipse/jgit/transport/PackParser;->setObjectChecker(Lorg/eclipse/jgit/lib/ObjectChecker;)V

    .line 876
    iget-object v4, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->this$0:Lorg/eclipse/jgit/transport/WalkFetchConnection;

    #getter for: Lorg/eclipse/jgit/transport/WalkFetchConnection;->lockMessage:Ljava/lang/String;
    invoke-static {v4}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->access$300(Lorg/eclipse/jgit/transport/WalkFetchConnection;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/eclipse/jgit/transport/PackParser;->setLockMessage(Ljava/lang/String;)V

    .line 877
    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/transport/PackParser;->parse(Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/internal/storage/file/PackLock;

    move-result-object v0

    .line 878
    .local v0, lock:Lorg/eclipse/jgit/internal/storage/file/PackLock;
    if-eqz v0, :cond_0

    .line 879
    iget-object v4, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->this$0:Lorg/eclipse/jgit/transport/WalkFetchConnection;

    #getter for: Lorg/eclipse/jgit/transport/WalkFetchConnection;->packLocks:Ljava/util/List;
    invoke-static {v4}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->access$400(Lorg/eclipse/jgit/transport/WalkFetchConnection;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 880
    :cond_0
    iget-object v4, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->this$0:Lorg/eclipse/jgit/transport/WalkFetchConnection;

    #getter for: Lorg/eclipse/jgit/transport/WalkFetchConnection;->inserter:Lorg/eclipse/jgit/lib/ObjectInserter;
    invoke-static {v4}, Lorg/eclipse/jgit/transport/WalkFetchConnection;->access$100(Lorg/eclipse/jgit/transport/WalkFetchConnection;)Lorg/eclipse/jgit/lib/ObjectInserter;

    move-result-object v4

    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/ObjectInserter;->flush()V

    .line 881
    return-void
.end method

.method openIndex(Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    .locals 12
    .parameter "pm"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 819
    iget-object v7, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->index:Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    if-eqz v7, :cond_0

    .line 868
    :goto_0
    return-void

    .line 821
    :cond_0
    iget-object v7, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->tmpIdx:Ljava/io/File;

    if-nez v7, :cond_2

    .line 822
    const-string v7, "jgit-walk-"

    const-string v8, ".idx"

    invoke-static {v7, v8}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v7

    iput-object v7, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->tmpIdx:Ljava/io/File;

    .line 833
    :cond_1
    :goto_1
    iget-object v7, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->connection:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "pack/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->idxName:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;->open(Ljava/lang/String;)Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;

    move-result-object v5

    .line 834
    .local v5, s:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Get "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->idxName:Ljava/lang/String;

    const/16 v9, 0xc

    invoke-virtual {v8, v6, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "..idx"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iget-wide v8, v5, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;->length:J

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-gez v8, :cond_3

    :goto_2
    invoke-interface {p1, v7, v6}, Lorg/eclipse/jgit/lib/ProgressMonitor;->beginTask(Ljava/lang/String;I)V

    .line 838
    :try_start_0
    new-instance v4, Ljava/io/FileOutputStream;

    iget-object v6, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->tmpIdx:Ljava/io/File;

    invoke-direct {v4, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 840
    .local v4, fos:Ljava/io/FileOutputStream;
    const/16 v6, 0x800

    :try_start_1
    new-array v0, v6, [B

    .line 842
    .local v0, buf:[B
    :goto_3
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->isCancelled()Z

    move-result v6

    if-nez v6, :cond_4

    iget-object v6, v5, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;->in:Ljava/io/InputStream;

    invoke-virtual {v6, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, cnt:I
    if-ltz v1, :cond_4

    .line 843
    const/4 v6, 0x0

    invoke-virtual {v4, v0, v6, v1}, Ljava/io/FileOutputStream;->write([BII)V

    .line 844
    div-int/lit16 v6, v1, 0x400

    invoke-interface {p1, v6}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_3

    .line 847
    .end local v0           #buf:[B
    .end local v1           #cnt:I
    :catchall_0
    move-exception v6

    :try_start_2
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    throw v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 849
    .end local v4           #fos:Ljava/io/FileOutputStream;
    :catch_0
    move-exception v3

    .line 850
    .local v3, err:Ljava/io/IOException;
    :try_start_3
    iget-object v6, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->tmpIdx:Ljava/io/File;

    invoke-static {v6}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;)V

    .line 851
    throw v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 853
    .end local v3           #err:Ljava/io/IOException;
    :catchall_1
    move-exception v6

    iget-object v7, v5, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;->in:Ljava/io/InputStream;

    invoke-virtual {v7}, Ljava/io/InputStream;->close()V

    throw v6

    .line 823
    .end local v5           #s:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;
    :cond_2
    iget-object v7, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->tmpIdx:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->isFile()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 825
    :try_start_4
    iget-object v7, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->tmpIdx:Ljava/io/File;

    invoke-static {v7}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->open(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v7

    iput-object v7, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->index:Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    :try_end_4
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_4} :catch_1

    goto/16 :goto_0

    .line 827
    :catch_1
    move-exception v7

    goto/16 :goto_1

    .line 834
    .restart local v5       #s:Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;
    :cond_3
    iget-wide v8, v5, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;->length:J

    const-wide/16 v10, 0x400

    div-long/2addr v8, v10

    long-to-int v6, v8

    goto :goto_2

    .line 847
    .restart local v0       #buf:[B
    .restart local v4       #fos:Ljava/io/FileOutputStream;
    :cond_4
    :try_start_5
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    .line 853
    iget-object v6, v5, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;->in:Ljava/io/InputStream;

    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    .line 855
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    .line 857
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->isCancelled()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 858
    iget-object v6, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->tmpIdx:Ljava/io/File;

    invoke-static {v6}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;)V

    goto/16 :goto_0

    .line 863
    :cond_5
    :try_start_6
    iget-object v6, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->tmpIdx:Ljava/io/File;

    invoke-static {v6}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->open(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v6

    iput-object v6, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->index:Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2

    goto/16 :goto_0

    .line 864
    :catch_2
    move-exception v2

    .line 865
    .local v2, e:Ljava/io/IOException;
    iget-object v6, p0, Lorg/eclipse/jgit/transport/WalkFetchConnection$RemotePack;->tmpIdx:Ljava/io/File;

    invoke-static {v6}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;)V

    .line 866
    throw v2
.end method
