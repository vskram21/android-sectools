.class Lorg/eclipse/jgit/transport/AmazonS3$1;
.super Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;
.source "AmazonS3.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/transport/AmazonS3;->beginPut(Ljava/lang/String;Ljava/lang/String;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/lang/String;)Ljava/io/OutputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/transport/AmazonS3;

.field final synthetic val$bucket:Ljava/lang/String;

.field final synthetic val$key:Ljava/lang/String;

.field final synthetic val$md5:Ljava/security/MessageDigest;

.field final synthetic val$monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

.field final synthetic val$monitorTask:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/AmazonS3;Ljava/lang/String;Ljava/lang/String;Ljava/security/MessageDigest;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 455
    iput-object p1, p0, Lorg/eclipse/jgit/transport/AmazonS3$1;->this$0:Lorg/eclipse/jgit/transport/AmazonS3;

    iput-object p2, p0, Lorg/eclipse/jgit/transport/AmazonS3$1;->val$bucket:Ljava/lang/String;

    iput-object p3, p0, Lorg/eclipse/jgit/transport/AmazonS3$1;->val$key:Ljava/lang/String;

    iput-object p4, p0, Lorg/eclipse/jgit/transport/AmazonS3$1;->val$md5:Ljava/security/MessageDigest;

    iput-object p5, p0, Lorg/eclipse/jgit/transport/AmazonS3$1;->val$monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    iput-object p6, p0, Lorg/eclipse/jgit/transport/AmazonS3$1;->val$monitorTask:Ljava/lang/String;

    invoke-direct {p0}, Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;-><init>()V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 458
    invoke-super {p0}, Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;->close()V

    .line 460
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/AmazonS3$1;->this$0:Lorg/eclipse/jgit/transport/AmazonS3;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/AmazonS3$1;->val$bucket:Ljava/lang/String;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/AmazonS3$1;->val$key:Ljava/lang/String;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/AmazonS3$1;->val$md5:Ljava/security/MessageDigest;

    invoke-virtual {v3}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v3

    iget-object v5, p0, Lorg/eclipse/jgit/transport/AmazonS3$1;->val$monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    iget-object v6, p0, Lorg/eclipse/jgit/transport/AmazonS3$1;->val$monitorTask:Ljava/lang/String;

    move-object v4, p0

    #calls: Lorg/eclipse/jgit/transport/AmazonS3;->putImpl(Ljava/lang/String;Ljava/lang/String;[BLorg/eclipse/jgit/util/TemporaryBuffer;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/lang/String;)V
    invoke-static/range {v0 .. v6}, Lorg/eclipse/jgit/transport/AmazonS3;->access$000(Lorg/eclipse/jgit/transport/AmazonS3;Ljava/lang/String;Ljava/lang/String;[BLorg/eclipse/jgit/util/TemporaryBuffer;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 463
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/AmazonS3$1;->destroy()V

    .line 465
    return-void

    .line 463
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/AmazonS3$1;->destroy()V

    throw v0
.end method
