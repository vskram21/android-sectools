.class final Lorg/eclipse/jgit/transport/AdvertiseRefsHook$1;
.super Ljava/lang/Object;
.source "AdvertiseRefsHook.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/AdvertiseRefsHook;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/AdvertiseRefsHook;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public advertiseRefs(Lorg/eclipse/jgit/transport/BaseReceivePack;)V
    .locals 0
    .parameter "receivePack"

    .prologue
    .line 65
    return-void
.end method

.method public advertiseRefs(Lorg/eclipse/jgit/transport/UploadPack;)V
    .locals 0
    .parameter "uploadPack"

    .prologue
    .line 61
    return-void
.end method
