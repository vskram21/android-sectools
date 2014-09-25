.class Lorg/openintents/openpgp/util/OpenPgpApi$1;
.super Ljava/lang/Object;
.source "OpenPgpApi.java"

# interfaces
.implements Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$IThreadListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/openintents/openpgp/util/OpenPgpApi;->executeApi(Landroid/content/Intent;Ljava/io/InputStream;Ljava/io/OutputStream;)Landroid/content/Intent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/openintents/openpgp/util/OpenPgpApi;


# direct methods
.method constructor <init>(Lorg/openintents/openpgp/util/OpenPgpApi;)V
    .locals 0
    .parameter

    .prologue
    .line 260
    iput-object p1, p0, Lorg/openintents/openpgp/util/OpenPgpApi$1;->this$0:Lorg/openintents/openpgp/util/OpenPgpApi;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onThreadFinished(Ljava/lang/Thread;)V
    .locals 0
    .parameter "thread"

    .prologue
    .line 265
    return-void
.end method
