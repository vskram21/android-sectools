.class Lorg/eclipse/jgit/gitrepo/RepoCommand$CopyFile;
.super Ljava/lang/Object;
.source "RepoCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/gitrepo/RepoCommand;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CopyFile"
.end annotation


# instance fields
.field final dest:Ljava/lang/String;

.field final path:Ljava/lang/String;

.field final repo:Lorg/eclipse/jgit/lib/Repository;

.field final src:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter "repo"
    .parameter "path"
    .parameter "src"
    .parameter "dest"

    .prologue
    .line 206
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 207
    iput-object p1, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$CopyFile;->repo:Lorg/eclipse/jgit/lib/Repository;

    .line 208
    iput-object p2, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$CopyFile;->path:Ljava/lang/String;

    .line 209
    iput-object p3, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$CopyFile;->src:Ljava/lang/String;

    .line 210
    iput-object p4, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$CopyFile;->dest:Ljava/lang/String;

    .line 211
    return-void
.end method


# virtual methods
.method copy()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 214
    new-instance v9, Ljava/io/File;

    iget-object v0, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$CopyFile;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$CopyFile;->path:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$CopyFile;->src:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v9, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 216
    .local v9, srcFile:Ljava/io/File;
    new-instance v6, Ljava/io/File;

    iget-object v0, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$CopyFile;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v0

    iget-object v2, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$CopyFile;->dest:Ljava/lang/String;

    invoke-direct {v6, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 217
    .local v6, destFile:Ljava/io/File;
    new-instance v7, Ljava/io/FileInputStream;

    invoke-direct {v7, v9}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 219
    .local v7, input:Ljava/io/FileInputStream;
    :try_start_0
    new-instance v8, Ljava/io/FileOutputStream;

    invoke-direct {v8, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 221
    .local v8, output:Ljava/io/FileOutputStream;
    :try_start_1
    invoke-virtual {v7}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v1

    .line 222
    .local v1, channel:Ljava/nio/channels/FileChannel;
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    const-wide/16 v2, 0x0

    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Ljava/nio/channels/FileChannel;->transferFrom(Ljava/nio/channels/ReadableByteChannel;JJ)J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 224
    :try_start_2
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 227
    invoke-virtual {v7}, Ljava/io/FileInputStream;->close()V

    .line 229
    return-void

    .line 224
    .end local v1           #channel:Ljava/nio/channels/FileChannel;
    :catchall_0
    move-exception v0

    :try_start_3
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V

    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 227
    .end local v8           #output:Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v0

    invoke-virtual {v7}, Ljava/io/FileInputStream;->close()V

    throw v0
.end method
