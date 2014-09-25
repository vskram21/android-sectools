.class Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;
.super Ljava/lang/Thread;
.source "ParcelFileDescriptorUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "TransferThread"
.end annotation


# instance fields
.field final mIn:Ljava/io/InputStream;

.field final mListener:Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$IThreadListener;

.field final mOut:Ljava/io/OutputStream;


# direct methods
.method constructor <init>(Ljava/io/InputStream;Ljava/io/OutputStream;Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$IThreadListener;)V
    .locals 1
    .parameter "in"
    .parameter "out"
    .parameter "listener"

    .prologue
    .line 69
    const-string v0, "ParcelFileDescriptor Transfer Thread"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 70
    iput-object p1, p0, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;->mIn:Ljava/io/InputStream;

    .line 71
    iput-object p2, p0, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;->mOut:Ljava/io/OutputStream;

    .line 72
    iput-object p3, p0, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;->mListener:Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$IThreadListener;

    .line 73
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;->setDaemon(Z)V

    .line 74
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 78
    const/16 v2, 0x400

    new-array v0, v2, [B

    .line 82
    .local v0, buf:[B
    :goto_0
    :try_start_0
    iget-object v2, p0, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;->mIn:Ljava/io/InputStream;

    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, len:I
    if-lez v1, :cond_1

    .line 83
    iget-object v2, p0, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;->mOut:Ljava/io/OutputStream;

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3, v1}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 86
    .end local v1           #len:I
    :catch_0
    move-exception v2

    .line 90
    :try_start_1
    iget-object v2, p0, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;->mIn:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_5

    .line 95
    :goto_1
    :try_start_2
    iget-object v2, p0, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;->mOut:Ljava/io/OutputStream;

    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4

    .line 100
    :goto_2
    iget-object v2, p0, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;->mListener:Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$IThreadListener;

    if-eqz v2, :cond_0

    .line 102
    iget-object v2, p0, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;->mListener:Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$IThreadListener;

    invoke-interface {v2, p0}, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$IThreadListener;->onThreadFinished(Ljava/lang/Thread;)V

    .line 104
    :cond_0
    return-void

    .line 85
    .restart local v1       #len:I
    :cond_1
    :try_start_3
    iget-object v2, p0, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;->mOut:Ljava/io/OutputStream;

    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 90
    :try_start_4
    iget-object v2, p0, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;->mIn:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_6

    .line 95
    :goto_3
    :try_start_5
    iget-object v2, p0, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;->mOut:Ljava/io/OutputStream;

    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_2

    .line 96
    :catch_1
    move-exception v2

    goto :goto_2

    .line 89
    .end local v1           #len:I
    :catchall_0
    move-exception v2

    .line 90
    :try_start_6
    iget-object v3, p0, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;->mIn:Ljava/io/InputStream;

    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    .line 95
    :goto_4
    :try_start_7
    iget-object v3, p0, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;->mOut:Ljava/io/OutputStream;

    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_2

    .line 98
    :goto_5
    throw v2

    .line 96
    :catch_2
    move-exception v3

    goto :goto_5

    .line 91
    :catch_3
    move-exception v3

    goto :goto_4

    .line 96
    :catch_4
    move-exception v2

    goto :goto_2

    .line 91
    :catch_5
    move-exception v2

    goto :goto_1

    .restart local v1       #len:I
    :catch_6
    move-exception v2

    goto :goto_3
.end method
