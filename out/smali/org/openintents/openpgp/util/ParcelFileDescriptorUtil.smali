.class public Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil;
.super Ljava/lang/Object;
.source "ParcelFileDescriptorUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;,
        Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$IThreadListener;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    return-void
.end method

.method public static pipeFrom(Ljava/io/InputStream;Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$IThreadListener;)Landroid/os/ParcelFileDescriptor;
    .locals 5
    .parameter "inputStream"
    .parameter "listener"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 37
    invoke-static {}, Landroid/os/ParcelFileDescriptor;->createPipe()[Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    .line 38
    .local v0, pipe:[Landroid/os/ParcelFileDescriptor;
    const/4 v3, 0x0

    aget-object v1, v0, v3

    .line 39
    .local v1, readSide:Landroid/os/ParcelFileDescriptor;
    const/4 v3, 0x1

    aget-object v2, v0, v3

    .line 42
    .local v2, writeSide:Landroid/os/ParcelFileDescriptor;
    new-instance v3, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;

    new-instance v4, Landroid/os/ParcelFileDescriptor$AutoCloseOutputStream;

    invoke-direct {v4, v2}, Landroid/os/ParcelFileDescriptor$AutoCloseOutputStream;-><init>(Landroid/os/ParcelFileDescriptor;)V

    invoke-direct {v3, p0, v4, p1}, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$IThreadListener;)V

    invoke-virtual {v3}, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;->start()V

    .line 46
    return-object v1
.end method

.method public static pipeTo(Ljava/io/OutputStream;Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$IThreadListener;)Landroid/os/ParcelFileDescriptor;
    .locals 5
    .parameter "outputStream"
    .parameter "listener"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 51
    invoke-static {}, Landroid/os/ParcelFileDescriptor;->createPipe()[Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    .line 52
    .local v0, pipe:[Landroid/os/ParcelFileDescriptor;
    const/4 v3, 0x0

    aget-object v1, v0, v3

    .line 53
    .local v1, readSide:Landroid/os/ParcelFileDescriptor;
    const/4 v3, 0x1

    aget-object v2, v0, v3

    .line 56
    .local v2, writeSide:Landroid/os/ParcelFileDescriptor;
    new-instance v3, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;

    new-instance v4, Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;

    invoke-direct {v4, v1}, Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;-><init>(Landroid/os/ParcelFileDescriptor;)V

    invoke-direct {v3, v4, p0, p1}, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$IThreadListener;)V

    invoke-virtual {v3}, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;->start()V

    .line 60
    return-object v2
.end method
