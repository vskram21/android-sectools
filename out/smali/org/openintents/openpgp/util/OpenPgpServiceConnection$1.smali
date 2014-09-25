.class Lorg/openintents/openpgp/util/OpenPgpServiceConnection$1;
.super Ljava/lang/Object;
.source "OpenPgpServiceConnection.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/openintents/openpgp/util/OpenPgpServiceConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/openintents/openpgp/util/OpenPgpServiceConnection;


# direct methods
.method constructor <init>(Lorg/openintents/openpgp/util/OpenPgpServiceConnection;)V
    .locals 0
    .parameter

    .prologue
    .line 77
    iput-object p1, p0, Lorg/openintents/openpgp/util/OpenPgpServiceConnection$1;->this$0:Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2
    .parameter "name"
    .parameter "service"

    .prologue
    .line 79
    iget-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpServiceConnection$1;->this$0:Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

    invoke-static {p2}, Lorg/openintents/openpgp/IOpenPgpService$Stub;->asInterface(Landroid/os/IBinder;)Lorg/openintents/openpgp/IOpenPgpService;

    move-result-object v1

    #setter for: Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->mService:Lorg/openintents/openpgp/IOpenPgpService;
    invoke-static {v0, v1}, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->access$002(Lorg/openintents/openpgp/util/OpenPgpServiceConnection;Lorg/openintents/openpgp/IOpenPgpService;)Lorg/openintents/openpgp/IOpenPgpService;

    .line 80
    iget-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpServiceConnection$1;->this$0:Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

    #getter for: Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->mOnBoundListener:Lorg/openintents/openpgp/util/OpenPgpServiceConnection$OnBound;
    invoke-static {v0}, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->access$100(Lorg/openintents/openpgp/util/OpenPgpServiceConnection;)Lorg/openintents/openpgp/util/OpenPgpServiceConnection$OnBound;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 81
    iget-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpServiceConnection$1;->this$0:Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

    #getter for: Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->mOnBoundListener:Lorg/openintents/openpgp/util/OpenPgpServiceConnection$OnBound;
    invoke-static {v0}, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->access$100(Lorg/openintents/openpgp/util/OpenPgpServiceConnection;)Lorg/openintents/openpgp/util/OpenPgpServiceConnection$OnBound;

    move-result-object v0

    iget-object v1, p0, Lorg/openintents/openpgp/util/OpenPgpServiceConnection$1;->this$0:Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

    #getter for: Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->mService:Lorg/openintents/openpgp/IOpenPgpService;
    invoke-static {v1}, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->access$000(Lorg/openintents/openpgp/util/OpenPgpServiceConnection;)Lorg/openintents/openpgp/IOpenPgpService;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/openintents/openpgp/util/OpenPgpServiceConnection$OnBound;->onBound(Lorg/openintents/openpgp/IOpenPgpService;)V

    .line 83
    :cond_0
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .parameter "name"

    .prologue
    .line 86
    iget-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpServiceConnection$1;->this$0:Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

    const/4 v1, 0x0

    #setter for: Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->mService:Lorg/openintents/openpgp/IOpenPgpService;
    invoke-static {v0, v1}, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->access$002(Lorg/openintents/openpgp/util/OpenPgpServiceConnection;Lorg/openintents/openpgp/IOpenPgpService;)Lorg/openintents/openpgp/IOpenPgpService;

    .line 87
    return-void
.end method
